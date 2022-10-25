CREATE DATABASE projetos

GO

use projetos

GO

CREATE TABLE projects(
id			INT				IDENTITY (10001, 1)			NOT NULL,
name		VARCHAR(45)									NOT NULL,
description VARCHAR(45)									NOT NULL,
date		DATE	CHECK(date > '2014-09-01')			NOT NULL
PRIMARY KEY (id)
)

GO

CREATE TABLE users(
id			INT			IDENTITY (1,1)					NOT NULL,
name		VARCHAR(45)									NOT NULL,
username	VARCHAR(45)									NOT NULL,
password	VARCHAR(45)	DEFAULT '123mudar'				NOT NULL,
email		VARCHAR(45)									NOT NULL
PRIMARY KEY (id),
)

GO

CREATE TABLE users_hars_projects (
users_id		INT						NOT NULL,
projects_id		INT						NOT NULL
PRIMARY KEY(users_id, projects_id)
FOREIGN KEY(users_id) REFERENCES users (id),
FOREIGN KEY(projects_id) REFERENCES projects (id)
)

GO

ALTER TABLE users
ALTER COLUMN username VARCHAR(10)									NOT NULL 

ALTER TABLE users
ADD CONSTRAINT user_unico  UNIQUE(username)

GO
ALTER TABLE users
ALTER COLUMN password  VARCHAR(8)									NOT NULL 

GO

INSERT INTO users VALUES 
('Maria', 'Rh_maria', '123mudar', 'maria@empresa.com'),
('Paulo', 'Ti_paulo', '123@456', 'paulo@empresa.com'),
('Ana', 'Rh_ana', '123mudar', 'ana@empresa.com'),
('Clara', 'Ti_clara', '123mudar', 'clara@empresa.com'),
('Aparecido', 'Rh_apareci', '55@!cido', 'aparecido@empresa.com')
GO

INSERT INTO	projects VALUES
('Re-folha', 'Refatoração das folhas', '05-09-2014'),
('Manutenção PCs ', 'Manutenção PCs', '06-09-2014'),
('Auditoria', '', '07-09-2014')
GO

INSERT INTO users_hars_projects (users_id, projects_id)
VALUES
(1, 10001),
(5, 10001),
(3, 10003),
(4, 10002),
(2, 10002)


UPDATE projects
SET date = '12/09/2014'
WHERE id = 10002

UPDATE users
SET username = 'Rh_cido'
WHERE id = 5

UPDATE users
SET password = '888@*'
WHERE id = 1 AND password = '123mudar'

DELETE users_hars_projects
WHERE users_id = 2


SELECT * FROM projects
SELECT * FROM users
SELECT * FROM users_hars_projects

use master
drop database projetos
