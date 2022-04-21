use movie1;
#find name and year of movies return movie title and year
select mov_title, mov_year from Movie;

#from movie table find american beauty return its release year
select mov_year
from Movie
where mov_title = 'American Beauty';

#find movie which are made in 1999 return thier title
select mov_title
from Movie
where mov_year = 1999;

#from reviewer return movies with rating higher than 7
select rev_name from Reviewer where rev_id in 
( select rev_id from rating where rev_star >= 7);

#first name = woody lat name = allen return actor id
select act_id from Actor
where act_fname = 'Woody' and act_lname = 'Allen';


#----------%-------------------NEW QUERY-------------------%----------

#list of horror movies
select mov_title from movie
where mov_id in
(select mov_id from movie_genres where gen_id in
(select gen_id from genres where gen_title='Horror'));

#reviews of 8+ star
select rev_name from Reviewer where rev_id in 
( select rev_id from rating where rev_star > 8);

#all info of actors acted in movie Deliverance
select act_fname,act_lname from actor
where act_id in
(select act_id from movie_cast where mov_id in
(select mov_id from movie where mov_title='Deliverance'));

#dir full name who directed movie Eyes Wide Shut using subquery.
select dir_fname, dir_lname from Director where dir_id in 
( select dir_id from Mov_director where mov_id in 
( select mov_id from Movie where mov_title = 'Eyes Wide Shut'));

#find mov_title, year, date, dir, actor whose reviewer is Neal Wruck
SELECT mov_title, mov_year, mov_dt_rel, dir_fname, dir_lname, act_fname, act_lname
FROM movie a, movie_director b, director c, ratings d, reviewer e, actor f, movie_cast g
WHERE a.mov_id = b.mov_id
AND b.dir_id = c.dir_id
AND a.mov_id = d.mov_id
AND d.rev_id = e.rev_id
AND a.mov_id = g.mov_id
AND g.act_id = f.act_id
AND e.rev_name = 'Neal Wruck';

#find all the years in which atleast one movie produced 4+ star rating
select mov_year from movie where mov_id in 
(select mov_id from rating where rev_stars>4.00);

#all movies with rating in null
select distinct mov_year from Movie where mov_id in 
( select mov_id from Rating where rev_star = Null);

#all movies directed by david
select mov_title from Movie where mov_id in 
( select mov_id from Mov_director where dir_id in 
( select dir_id from Director where dir_fname = 'David'));

#first name last name and roles  of actors who were in Boggie Nights 
select act_fname, act_lname, movie_cast.role1
from actor,movie_cast,movie
where actor.act_id=movie_cast.act_id AND
movie_cast.mov_id=movie.mov_id AND
mov_title='Boogie Nights';

#name of actor worked in more than 1 movies 
SELECT act_fname,act_lname
FROM actor
WHERE act_id IN 
(SELECT act_id FROM movie_cast GROUP BY act_id HAVING count(act_id)>1)

