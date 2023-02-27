create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;

create table Class
(
    ClassID int not null auto_increment primary key,
    ClassName varchar(60) not null,
    StartDate datetime    not null,
    Status bit
);
create table Student
(
    StudentId   int         not null auto_increment primary key,
    StudentName varchar(30) not null,
    Address     varchar(50),
    Phone       varchar(20),
    Status      bit,
    ClassId     int         not null,
    foreign key (ClassId) references Class (ClassID)
);
create table Subject
(
    SubId   int         not null auto_increment primary key,
    SubName varchar(30) not null,
    Credit  tinyint    not null default 1 CHECK ( Credit >= 1 ),
    Status  bit                  default 1
);
create table Mark
(
    MarkId    int not null auto_increment primary key,
    SubId     int not null,
    StudentId int not null,
    Mark      FLOAT   default 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes tinyint default 1,
    unique (SubId, StudentId),
    foreign key (SubId) references Subject (SubId),
    foreign key (StudentId) references Student (StudentId)
);