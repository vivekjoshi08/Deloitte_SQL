select dayname(date(((period_add(extract(year_month from curdate()),-3)*100)+1))) as Day;

#2 play whith a bit more to learn how 28 day month is showing accurate result on +31 
select dayname(date(((period_add(extract(year_month from curdate()),-3)*100)+31))) as Day;

#3
select dayname(makedate(extract(year from curdate()), 1)) as Day;

#4 
select dayname(str_to_date(concat(31,12,extract(year from curdate())), "%d%m%Y")) as day;

select dayname(date(((period_add(extract(year_month from curdate()),+8)*100)+31))) as Day;

#5
#what if we want to take input from user input = &input.
select extract(year from curdate()) - '1999' as age;

#6
select date_format( curdate(), "%M %d, %Y" );

#7 
select extract(year from curdate()) as year;

#8
select date_format( now(), "%W %D %M %Y %T" ) as x;

#9
select date_format( curdate(), "%d/%m/%Y" );

#10
#querry how to add current time
select date_format( now(), "%r %b %d, %Y" );