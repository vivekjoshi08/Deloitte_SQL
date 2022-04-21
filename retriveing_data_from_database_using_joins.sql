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
select rev_name from Reviewer 
inner join rating on rating.rev_id = Reviewer.rev_id
where rev_star >= 7;

#first name = woody lat name = allen return actor id
select act_id from Actor
where act_fname = 'Woody' and act_lname = 'Allen';


#----------%-------------------NEW QUERY-------------------%----------

#list of horror movies
select mov_title from Movie 
inner join Mov_gen on Mov_gen.mov_id = Movie.mov_id
inner join Genre on Genre.gen_id = Mov_gen.gen_id
where Genre.gen_title = 'Horror';

#reviews of 8+ star
select rev_name from Reviewer 
inner join rating on rating.rev_id = Reviewer.rev_id
where rev_star > 8;

#all info of actors acted in movie Deliverance
select act_fname, act_lname, act_gender from Actor 
inner join Movie_cast on Movie_cast.act_id = Actor.act_id
inner join Movie on Movie.mov_id = Movie_cast.mov_id
where Movie.mov_title = 'Deliverance';

#dir full name who directed movie Eyes Wide Shut using subquery
select dir_fname, dir_lname from Director d
inner join Mov_director as md on md.dir_id = d.dir_id
inner join Movie as m on m.mov_id = md.mov_id
where mov_title = 'Eyes Wide Shut';

#find mov_title, year, date, dir, actor whose reviewer is Neal Wruck
select mov_title, mov_year, mov_dt_rel, dir_fname, dir_lname, act_fname, act_lname from Movie
inner join Mov_director on Mov_director.mov_id = Movie.mov_id
inner join Director on Director.dir_id = Mov_director.dir_id
inner join Movie_cast on Movie_cast.mov_id = Movie.mov_id
inner join Actor on Actor.act_id = Movie_cast.act_id
inner join Rating on Rating.mov_id = Movie.mov_id
inner join Reviewer on Reviewer.rev_id = Rating.rev_id
where Reviewer.rev_name = 'Neal Wruck';

#find all the years in which atleast one movie produced 4+ star rating
select mov_year from Movie
inner join Rating on Rating.mov_id = Movie.mov_id
where Rating.rev_star > 4;

#all movies with rating in null
select distinct mov_year from Movie 
inner join Rating on Rating.mov_id = Movie.mov_id
where rev_star is Null;

#all movies directed by david
select mov_title from Movie 
inner join Mov_director on Mov_director.mov_id = Movie.mov_id
inner join Director on Director.dir_id = Mov_director.dir_id
where dir_fname = 'David';

#first name last name and roles  of actors who were in Boggie Nights 
select act_fname, act_lname, role_ from Actor
inner join Movie_cast on Movie_cast.act_id = Actor.act_id
inner join Movie on Movie.mov_id = Movie_cast.mov_id
where Movie.mov_title = 'Boogie Nights';

#name of actor worked in more than 1 movies 
select Actor.act_id, Actor.act_fname, Actor.act_lname from Actor
join Movie_cast on Movie_cast.act_id = Actor.act_id
group by Actor.act_id
having count(Actor.act_id ) > 1;