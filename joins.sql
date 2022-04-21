
#Join on Movie & Rating (just demo of syntax nothing to yield from it so let go of finding any valuable insight from it)

#----------@Inner----------@----------
select mov_year from Movie
inner join Rating on Rating.mov_id = Movie.mov_id
where Rating.rev_star = 4;

#----------@----------outer----------@--------- 

# right outer
select mov_year from Movie
right join Rating on Rating.mov_id = Movie.mov_id
where Rating.rev_star > 4;

#left
select mov_year from Movie
left join Rating on Rating.mov_id = Movie.mov_id
where Rating.rev_star > 4;

#full
#------------------------------ask why full outer is not working here (it is showing syntax error)
select mov_year from Movie
full outer join Rating on Rating.mov_id = Movie.mov_id
where Rating.rev_star > 4;

#new_full outer(Sir told their is nothing like full outer join - to find full outer go for --join-- in place of full outer join)
select * from Movie
join Rating on Rating.mov_id = Movie.mov_id;
#----------@----------self----------@----------