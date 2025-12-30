CREATE database btth_ss4;
USE btth_SS4;

-- Câu 1
CREATE TABLE Reader (
	reader_id int auto_increment primary key,
    reader_name varchar(100) not null,
    phone varchar(15) unique,
    register_date date default(current_date())
);

CREATE TABLE Book (
	book_id int primary key,
    book_title varchar(100) not null,
    author varchar(100),
	publish_year int check(publish_year >= 1900)
);

CREATE TABLE Borrow (
	reader_id int,
    book_id int,
    borrow_date date default(current_date()),
    return_date date    
);


-- Câu 2
ALTER TABLE Reader ADD email varchar(100) unique;
ALTER TABLE Book MODIFY author varchar(150);
ALTER TABLE Borrow
ADD CONSTRAINT chk_return
CHECK (return_date IS NULL OR return_date >= borrow_date);

-- Câu 3
INSERT INTO Reader (reader_name, phone, email, register_date)
VALUES
('Nguyễn Văn An', '0901234567', 'an.nguyen@gmail.com', '2024-09-01'),
('Trần Thị Bình', '0912345678', 'binh.tran@gmail.com', '2024-09-05'),
('Lê Minh Châu', '0923456789', 'chau.le@gmail.com', '2024-09-10');

INSERT INTO Book (book_id, book_title, author, publish_year)
VALUES
('101', 'Lập trình C căn bản', 'Nguyễn Văn A', '2018'),
('102', 'Cơ sở dữ liệu', 'Trần Thị B', '2020'),
('103', 'Lập trình Java', 'Lê Minh C', '2019'),
('104', 'Hệ quản trị MySQL', 'Phạm Văn D', '2021');

INSERT INTO Borrow (reader_id, book_id, borrow_date, return_date)
VALUES
(1, 101, '2024-09-15', NULL),
(1, 102, '2024-09-15', '2024-09-25'),
(2, 103, '2024-09-18', NULL);

UPDATE Borrow
SET return_date = '2024-10-01'
WHERE reader_id = 1;

UPDATE Book
SET publish_year = 2023
WHERE publish_year >= 2021;

DELETE FROM Borrow
WHERE borrow_date < '2024-09-18';


SELECT * FROM Reader;
SELECT * FROM Book;
SELECT * FROM Borrow;


