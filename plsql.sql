
-- 4. Display member borrowing trends with LAG function to show previous transaction date

SELECT 
    member_id,
    transaction_id,
    issue_date,
    LAG(issue_date) OVER (PARTITION BY member_id ORDER BY issue_date) AS previous_transaction_date
FROM TRANSACTIONS
ORDER BY member_id, issue_date;




-- Task 4.1: Stored Procedure 

DELIMITER $$

CREATE PROCEDURE ISSUE_BOOK (
    IN p_member_id INT,
    IN p_book_id INT
)
proc_label: BEGIN
    DECLARE v_available INT DEFAULT 0;
    DECLARE v_max_transaction_id INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: Could not issue book.' AS message;
    END;

    START TRANSACTION;

    -- Check book availability
    SELECT available_copies INTO v_available
    FROM BOOKS
    WHERE book_id = p_book_id
    FOR UPDATE;

    IF v_available IS NULL THEN
        ROLLBACK;
        SELECT 'Error: Book does not exist.' AS message;
        LEAVE proc_label; -- Leave the labeled block
    END IF;

    IF v_available <= 0 THEN
        ROLLBACK;
        SELECT 'Error: Book not available for issuing.' AS message;
        LEAVE proc_label; -- Leave the labeled block
    END IF;

    -- Get max transaction_id to generate new transaction id
    SELECT IFNULL(MAX(transaction_id), 0) INTO v_max_transaction_id FROM TRANSACTIONS;

    -- Insert transaction record
    INSERT INTO TRANSACTIONS (
        transaction_id, member_id, book_id, issue_date, due_date, return_date, fine_amount, status
    ) VALUES (
        v_max_transaction_id + 1,
        p_member_id,
        p_book_id,
        CURDATE(),
        DATE_ADD(CURDATE(), INTERVAL 14 DAY),
        NULL,
        0.00,
        'Pending'
    );

    -- Update available copies
    UPDATE BOOKS
    SET available_copies = available_copies - 1
    WHERE book_id = p_book_id;

    COMMIT;

    SELECT CONCAT('Book issued successfully. Transaction ID: ', v_max_transaction_id + 1) AS message;

END proc_label $$

DELIMITER ;



-- 4.2

DELIMITER $$

CREATE FUNCTION CALCULATE_FINE(p_transaction_id INT) 
RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
    DECLARE v_due_date DATE;
    DECLARE v_return_date DATE;
    DECLARE v_today DATE;
    DECLARE v_overdue_days INT DEFAULT 0;
    DECLARE v_fine DECIMAL(6,2) DEFAULT 0.00;

    SET v_today = CURDATE();

    -- Get due_date and return_date for the transaction
    SELECT due_date, return_date 
    INTO v_due_date, v_return_date
    FROM TRANSACTIONS
    WHERE transaction_id = p_transaction_id;

    -- Calculate overdue days
    IF v_return_date IS NOT NULL THEN
        SET v_overdue_days = DATEDIFF(v_return_date, v_due_date);
    ELSE
        SET v_overdue_days = DATEDIFF(v_today, v_due_date);
    END IF;

    -- If overdue days > 0, calculate fine (₹5 per day)
    IF v_overdue_days > 0 THEN
        SET v_fine = v_overdue_days * 5;
    ELSE
        SET v_fine = 0.00;
    END IF;

    RETURN v_fine;
END $$

DELIMITER ;


SELECT CALCULATE_FINE(1) AS fine_for_transaction_1;


-- 4.3

DELIMITER $$

CREATE TRIGGER update_available_copies_after_return
AFTER UPDATE ON TRANSACTIONS
FOR EACH ROW
BEGIN
    -- Check if status changed to 'Returned'
    IF OLD.status <> 'Returned' AND NEW.status = 'Returned' THEN
        UPDATE BOOKS
        SET available_copies = available_copies + 1
        WHERE book_id = NEW.book_id;
    END IF;
END $$

DELIMITER ;




-- 1. Create Users

CREATE USER 'librarian'@'localhost' IDENTIFIED BY 'lib_password123';
CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'student_password123';


-- 2 2. Grant Privileges

-- Grant full access to librarian
GRANT ALL PRIVILEGES ON Library_Management_System.* TO 'librarian'@'localhost';

-- Grant SELECT only on BOOKS table to student_user
GRANT SELECT ON Library_Management_System.BOOKS TO 'student_user'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;



DROP USER 'librarian'@'localhost';
DROP USER 'student_user'@'localhost';



CREATE USER 'librarian'@'localhost' IDENTIFIED BY 'lib_password123';
CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'student_password123';


GRANT ALL PRIVILEGES ON Library_Management_System.* TO 'librarian'@'localhost';
GRANT SELECT ON Library_Management_System.BOOKS TO 'student_user'@'localhost';
FLUSH PRIVILEGES;


