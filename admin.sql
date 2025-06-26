
-- 5

-- 1. Create Indexes on Frequently Queried Columns

CREATE INDEX idx_books_author ON BOOKS(author);
CREATE INDEX idx_books_title ON BOOKS(title);
CREATE INDEX idx_transactions_member ON TRANSACTIONS(member_id);
CREATE INDEX idx_transactions_book ON TRANSACTIONS(book_id);


-- 2. Write a Query to Show Execution Plan for Finding Books by Author

EXPLAIN SELECT * FROM BOOKS WHERE author = 'John Smith';

