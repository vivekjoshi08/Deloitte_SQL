use movie_database1;

set foreign_key_checks = 0;
delete from Reviewer where rev_name is null;
set foreign_key_checks = 1;

select * from Reviewer;