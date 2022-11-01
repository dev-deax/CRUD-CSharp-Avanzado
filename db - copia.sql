--CREATE DATABASE db_CS;
--GO
USE db_CS;
GO
-- ************************************** [courses]
CREATE TABLE [courses]
(
  [course_id]   int IDENTITY (1, 1) NOT NULL ,
  [course_name] varchar(50) NOT NULL ,
  [course_time_start] time(7) NOT NULL ,
  [course_time_end] time(7) NOT NULL ,
  CONSTRAINT [PK_course] PRIMARY KEY CLUSTERED ([course_id] ASC)
);
GO
-- ************************************** [Students]
CREATE TABLE [students]
(
  [student_id]        int IDENTITY (1, 1) NOT NULL ,
  [student_name]      varchar(50) NOT NULL ,
  [student_last_name] varchar(50) NOT NULL ,
  [student_age]       int NOT NULL ,
  [student_email]     varchar(50) NOT NULL ,
  [student_avatar]    image NULL ,
  [student_password]  nvarchar(256) NOT NULL ,
  CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED ([student_id] ASC)
);
GO
-- ************************************** [Teachers]
CREATE TABLE [teachers]
(
  [teacher_id]        int IDENTITY (1, 1) NOT NULL ,
  [teacher_name]      varchar(50) NOT NULL ,
  [teacher_last_name] varchar(50) NOT NULL ,
  [teacher_age]       int NOT NULL ,
  [teacher_email]     varchar(50) NOT NULL ,
  [teacher_avatar]    image NULL ,
  [teacher_password]  nvarchar(256) NOT NULL ,
  CONSTRAINT [PK_teacher] PRIMARY KEY CLUSTERED ([teacher_id] ASC)
  );
GO
-- ************************************** [assign_course]
CREATE TABLE [assign_course]
(
  [teacher_id] int NOT NULL ,
  [course_id]  int NOT NULL ,
  [student_id] int NOT NULL ,
  CONSTRAINT [PK_assign_course] PRIMARY KEY CLUSTERED ([teacher_id] ASC, [course_id] ASC),
  CONSTRAINT [FK_1] FOREIGN KEY ([teacher_id])  REFERENCES [Teachers]([teacher_id]) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT [FK_2] FOREIGN KEY ([student_id])  REFERENCES [Students]([student_id]) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT [FK_3] FOREIGN KEY ([course_id])  REFERENCES [courses]([course_id]) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE NONCLUSTERED INDEX [FK_2] ON [assign_course] 
(
  [teacher_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [FK_3] ON [assign_course] 
(
  [student_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [FK_4] ON [assign_course] 
(
  [course_id] ASC
)
GO

---PROCEDIMIENTOS ALMACENADOS 
--------------------------MOSTRAR 
create proc showCourses
as
select * from courses
go
--------------------------INSERTAR 
create proc insertCourse
  @course_name varchar(50),
  @course_time_start time(7),
  @course_time_end time(7)
as
insert into courses values (@course_name,@course_time_start,@course_time_end)
go
------------------------ELIMINAR
create proc deleteCourse
@course_id int
as
delete from courses where [course_id]=@course_id
go
------------------EDITAR
create proc updateCourse
  @course_name varchar(50),
  @course_time_start time(7),
  @course_time_end time(7),
  @course_id int
as
update courses set [course_name]=@course_name, [course_time_start]=@course_time_start, [course_time_end]=@course_time_end where [course_id]=@course_id
go 