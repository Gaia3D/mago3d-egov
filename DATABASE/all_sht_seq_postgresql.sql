drop sequence if exists project_seq;
drop sequence if exists data_info_seq;
drop sequence if exists policy_seq;

create sequence project_seq increment 1 minvalue 1 maxvalue 999999999999 start 1 cache 1;
create sequence data_info_seq increment 1 minvalue 1 maxvalue 999999999999 start 1 cache 1;
create sequence policy_seq increment 1 minvalue 1 maxvalue 999999999999 start 2 cache 1;