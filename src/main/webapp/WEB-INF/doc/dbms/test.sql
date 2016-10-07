create table test1 (
  t_num number(2) not null primary key,
  title varchar2(100) not null
)

create table test2 (
  t_num number(2) not null primary key,
  t_num number(2) not null,
  title varchar2(50),
  foreign key (t_num) references test1(t_num)
);
drop table test2