drop database elet;

create database elet;

use elet;

create table tbl_users (
	id_user int not null auto_increment primary key,
    user_name varchar(50) not null unique,
    user_pwd varchar(100) not null,
    is_admin int not null,
    user_creation_date timestamp default current_timestamp
);

create table tbl_cases (
	id_case int not null auto_increment primary key,
    case_name varchar(200) not null,
    case_desc text not null,
    usr_id int not null,
    case_area varchar(25) not null default "Gerencia de Software",
    case_status varchar(25) not null default "Abierto",
    case_creation_date timestamp default current_timestamp,
    case_last_update_date timestamp on update current_timestamp,
    case_solution text,
    foreign key (usr_id) references tbl_users(id_user)
);

create table tbl_case_admin (
	id_case_admin int not null auto_increment primary key,
    case_id int not null unique,
    admin_id int not null,
    case_admin_creation_date timestamp default current_timestamp,
    foreign key (case_id) references tbl_cases(id_case),
    foreign key (admin_id) references tbl_users(id_user)
);

select case_id,case_name,case_status,user_name,user_creation_date from tbl_case_admin
inner join tbl_cases on tbl_case_admin.case_id = tbl_cases.id_case
inner join tbl_users on tbl_case_admin.admin_id = tbl_users.id_user;

create table tbl_faq(
	id_faq int not null auto_increment primary key,
    admin_id int not null,
    question_faq text not null,
    answer_faq text not null,
    faq_creation_date timestamp default current_timestamp,
    foreign key (admin_id) references tbl_users(id_user)
);

insert into tbl_faq (admin_id,question_faq,answer_faq) values (1, "Question1","Answer1");



select * from tbl_faq;



-- Crear un nuevo reporte
insert into tbl_users (user_name, user_pwd, is_admin) values ("jorgemi777", "tilinesio", 1);
insert into tbl_users (user_name, user_pwd, is_admin) values ("omarcito", "tilinesio", 0);
insert into tbl_users (user_name, user_pwd, is_admin) values ("mavri", "tilinesio", 0);
insert into tbl_users (user_name, user_pwd, is_admin) values ("maya", "tilinesio", 0);

insert into tbl_cases (case_name, case_desc, usr_id, case_solution) values ("Nombre 1", "Descripcion 1", 2, "Solución 1");
insert into tbl_cases (case_name, case_desc, usr_id, case_solution) values ("Nombre 2", "Descripcion 2", 3, "Solución 2");
insert into tbl_cases (case_name, case_desc, usr_id, case_solution) values ("Nombre 3", "Descripcion 3", 4, "Solución 3");

select * from tbl_users;
select * from tbl_cases;

insert into tbl_case_admin (case_id, admin_id) values (1, 1);
insert into tbl_case_admin (case_id, admin_id) values (2, 1);
insert into tbl_case_admin (case_id, admin_id) values (3, 1);

select * from tbl_case_admin;

-- Modificar el estado de un caso con id = 2
update tbl_cases set case_status = "Cerrado" where id_case = 1;

-- Modificar el departamento de un caso con id = 2
update tbl_cases set departamento = "Gerencia de Mantenimiento" where id = 2;

-- Eliminar el caso con id = 1
delete from tbl_cases where id = 1;

-- Contar numero de casos cerrados
select count(id) from tbl_cases where estado = "Cerrado";

select * from tbl_cases;

select id, case_name, case_desc from tbl_cases;



SELECT case_area,case_creation_date,case_desc from tbl_case_admin
INNER JOIN tbl_users ON tbl_case_admin.admin_id = tbl_users.id_user
INNER JOIN tbl_cases ON tbl_case_admin.case_id = tbl_cases.id_case WHERE admin_id=1 AND case_id=1;


-- Eliminar la tabla 'tbl_cases'
drop table tbl_cases;