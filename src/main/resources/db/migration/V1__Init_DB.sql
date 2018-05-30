create sequence hibernate_sequence start 1 increment 1;
create table groups (
  id int8 not null,
  abbreviation varchar(255),
  direction varchar(255),
  messages int4,
  name varchar(255),
  places int4,
  stat_count int4,
  teacher_id int8,
  university_id int8 not null, primary key (id));

create table groups_statements (
  group_id int8 not null,
  statements_id int8 not null,
  primary key (group_id, statements_id));

create table groups_students (
  group_id int8 not null,
  students_id int8 not null,
  primary key (group_id, students_id));

create table message (
  id int8 not null,
  filename varchar(255),
  tag varchar(20),
  text varchar(2048),
  user_id int8,
  group_id int8,
  primary key (id));

create table universities (
  id int8 not null,
  abbreviation varchar(255),
  address varchar(255),
  name varchar(255),
  primary key (id));

create table university_groups (
  university_id int8 not null,
  groups_id int8 not null,
  primary key (university_id, groups_id));

create table university_students (
  university_id int8 not null,
  students_id int8 not null,
  primary key (university_id, students_id));

create table user_role (
  user_id int8 not null,
  roles varchar(255));

create table users (
  id int8 not null,
  activation_code varchar(255),
  address varchar(255),
  email varchar(255),
  first_name varchar(255),
  active boolean,
  teacher boolean,
  stat boolean,
  last_name varchar(255),
  password varchar(255),
  phone varchar(255),
  username varchar(255),
  group_id int8,
  university_id int8,
  primary key (id));

alter table if exists groups_statements
  add constraint UK_64j3dqjrqa98a2q7dsgrw5mh3 unique (statements_id);

alter table if exists groups_students
  add constraint UK_rx1gg9e05eb316npu9okdt7u7 unique (students_id);

alter table if exists university_groups
  add constraint UK_9hj0xkd2j4qlwdsckm9407ntp unique (groups_id);

alter table if exists university_students
  add constraint UK_k2bcfuu9vxwnx0cq872x3a4ju unique (students_id);

alter table if exists groups
  add constraint FKfbehr2v3qarkb2wxo7ex18fi4 foreign key (teacher_id) references users;

alter table if exists groups
  add constraint FK6ikhwxhq1ohhdo3itlu13tx0k foreign key (university_id) references universities;

alter table if exists groups_statements
  add constraint FKo224g5cdetnksehj8c1lde4s1 foreign key (statements_id) references users;

alter table if exists groups_statements
  add constraint FKkmm8v2heiytujv4rwn5lguda2 foreign key (group_id) references groups;

alter table if exists groups_students
  add constraint FKpvecsvvd758a04vtjffrtvgcp foreign key (students_id) references users;

alter table if exists groups_students
  add constraint FK8jhg7j929xlnbng72mj0ccjvd foreign key (group_id) references groups;

alter table if exists message
  add constraint FKpdrb79dg3bgym7pydlf9k3p1n foreign key (user_id) references users;

alter table if exists message
  add constraint FK5sr3baej6btgfkj8wywusesy3 foreign key (group_id) references groups;

alter table if exists university_groups
  add constraint FK30urox6ayoyo6iisvt27066q5 foreign key (groups_id) references groups;

alter table if exists university_groups
  add constraint FKfq8pknwr0ppsbmktdt9alkn8i foreign key (university_id) references universities;

alter table if exists university_students
  add constraint FKcx6u242q675vlpnv25ii5jqq4 foreign key (students_id) references users;

alter table if exists university_students
  add constraint FK8s0o6oakvvqumc3h7gleqyy3f foreign key (university_id) references universities;

alter table if exists user_role
  add constraint FKj345gk1bovqvfame88rcx7yyx foreign key (user_id) references users;
alter table if exists users
  add constraint FKemfuglprp85bh5xwhfm898ysc foreign key (group_id) references groups;
alter table if exists users
  add constraint FKm6cuniuttvvmhstb2s32jsotf foreign key (university_id) references universities;
