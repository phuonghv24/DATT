CREATE DATABASE shoes
GO
USE shoes
GO
CREATE TABLE brand(
	id INT IDENTITY(1,1) PRIMARY KEY,
	created_at DATETIME NULL,
	[description] NVARCHAR(255) NULL,
	modified_at DATETIME NULL,
	[name] NVARCHAR(255) NOT NULL,
	[status] BIT NULL,
	thumbnail VARCHAR(255)
)
GO
CREATE TABLE category(
	id INT IDENTITY(1,1) PRIMARY KEY,
	created_at DATETIME NULL,
	modified_at DATETIME NULL,
	[name] NVARCHAR(255) NOT NULL,
	orders INT NULL,
	slug VARCHAR(255) NOT NULL,
	[status] BIT NULL
)
GO
CREATE TABLE users(
	id INT IDENTITY(1,1) PRIMARY KEY,
	[address] NVARCHAR(255) NULL,
	avatar VARCHAR(255) NULL,
	created_at DATETIME NULL,
	email VARCHAR(200) NOT NULL,
	full_name NVARCHAR(255) NULL,
	modified_at DATETIME NULL,
	[password] VARCHAR(255) NOT NULL,
	phone VARCHAR(255) NULL,
	roles VARCHAR(255) NOT NULL,
	[status] BIT NULL
)
GO
CREATE TABLE product(
	id VARCHAR(255) PRIMARY KEY,
	created_at DATETIME NULL,
	[description] NVARCHAR(MAX) NULL,
	image_feedback VARCHAR(MAX) NULL,
	images VARCHAR(MAX) NULL,
	modified_at DATETIME NULL,
	[name] NVARCHAR(255) NOT NULL,
	price BIGINT NULL,
	sale_price BIGINT NULL,
	slug VARCHAR(255) NOT NULL,
	[status] BIT NULL,
	total_sold BIGINT NULL,
	product_view int NULL,
	brand_id INT FOREIGN KEY REFERENCES brand(id)
)
GO 
CREATE TABLE product_category(
	product_id VARCHAR(255) FOREIGN KEY REFERENCES product(id),
	category_id INT FOREIGN KEY REFERENCES category(id),
)
GO
CREATE TABLE product_size(
	product_id VARCHAR(255),
	size INT,
	quantity INT NULL,
	PRIMARY KEY(product_id, size),
)
GO
CREATE TABLE promotion(
	id INT IDENTITY(1,1) PRIMARY KEY,
	coupon_code VARCHAR(255) NULL UNIQUE,
	created_at DATETIME NULL,
	discount_type INT NULL,
	discount_value BIGINT NULL,
	expired_at DATETIME NULL,
	is_active BIT NULL,
	is_public BIT NULL,
	maximum_discount_value BIGINT NULL,
	[name] NVARCHAR(255)
)
CREATE TABLE post(
	id INT IDENTITY(1,1) PRIMARY KEY,
	content NVARCHAR(MAX) NULL,
	created_at DATETIME NULL,
	[description] NVARCHAR(MAX) NULL,
	modified_at DATETIME NULL,
	published_at DATETIME NULL,
	slug VARCHAR(MAX) NULL,
	[status] INT DEFAULT 0,
	thumbnail NVARCHAR(255) NULL,
	title NVARCHAR(255) NOT NULL,
	created_by INT FOREIGN KEY REFERENCES users(id),
	modified_by INT FOREIGN KEY REFERENCES users(id),
)
GO
CREATE TABLE orders(
	id INT IDENTITY(1,1) PRIMARY KEY,
	created_at DATETIME NULL,
	modified_at DATETIME NULL,
	note NVARCHAR(255) NULL,
	price BIGINT NULL,
	promotion VARCHAR(MAX) NULL,
	quantity INT NULL,
	receiver_address NVARCHAR(255) NULL,
	receiver_name NVARCHAR(255) NULL,
	receiver_phone NVARCHAR(255) NULL,
	size INT NULL,
	[status] INT NULL,
	total_price BIGINT NULL,
	buyer INT FOREIGN KEY REFERENCES users(id),
	created_by INT FOREIGN KEY REFERENCES users(id),
	modified_by INT FOREIGN KEY REFERENCES users(id),
	product_id VARCHAR(255) FOREIGN KEY REFERENCES product(id),
)
GO
CREATE TABLE statistic(
	id INT IDENTITY(1,1) PRIMARY KEY,
	created_at DATETIME NULL,
	profit BIGINT NULL,
	quantity INT NULL,
	sales BIGINT NULL,
	order_id INT FOREIGN KEY REFERENCES orders(id),
)
GO 
CREATE TABLE images(
	id VARCHAR(255) PRIMARY KEY,
	created_at DATETIME NULL,
	link VARCHAR(255) NULL UNIQUE,
	[name] VARCHAR(255) NULL,
	size BIGINT NULL,
	[type] VARCHAR(255) NULL,
	created_by INT FOREIGN KEY REFERENCES users(id)
)
GO
CREATE TABLE comment(
	id INT IDENTITY(1,1) PRIMARY KEY,
	content NVARCHAR(MAX) NULL,
	created_at DATETIME NULL,
	post_id INT FOREIGN KEY REFERENCES post(id),
	product_id VARCHAR(255) FOREIGN KEY REFERENCES product(id),
	[user_id] INT FOREIGN KEY REFERENCES users(id),
)
SELECT * FROM users
SELECT TOP 3 * FROM post p WHERE p.status = 5 ORDER BY p.published_at DESC