use movie_database1;
#update gender in actor table
update actor set act_gender = ( case
when act_gender = 'M' then 'F'
when act_gender = 'F' then 'M'
end);

#reviewer table delete where rev_name = null
delete from Reviewer where rev_name = null;

#from rating table delte any row which contains null
delete from Rating 
where mov_id = null 
or rev_id = null
or rev_star = null
or num_o_ratings = null;

#remove movies released in 1999
set foreign_key_checks = 0;
delete from movie where mov_year = 1999;
set foreign_key_checks = 1;

#remove japanese movies from movie table
set foreign_key_checks = 0;
delete from Movie 
where mov_lang = 'Japanese';
set foreign_key_checks = 1;
