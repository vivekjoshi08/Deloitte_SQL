use movie1;



#group by, having, count 
select Actor.act_id, Actor.act_fname, Actor.act_lname from Actor
join Movie_cast on Movie_cast.act_id = Actor.act_id
group by Actor.act_id
having count(Actor.act_id ) > 1;

# min 
select min(rev_star) from Rating;

#finding movie id whose rating is minimum
select mov_id from Movie where mov_id in 
(select mov_id from Rating where rev_star in 
(select min(rev_star) from Rating));




#max
select max(rev_star) from Rating;
#harshit - actor who is casted in max movies
select act_id from 


#avg
select avg(rev_star) from Rating;

#sum
select sum(rev_star) from Rating;

#min - rating movie name
select mov_title from Movie where mov_id in ( select mov_id from Rating where rev_star = min(rev_star));

select Movie.mov_title from Movie 
inner join Rating on Rating.mov_id = Movie.mov_id
where rev_star = min(rev_star)

