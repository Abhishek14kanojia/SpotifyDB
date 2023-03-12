create database spotifyDB;

use spotifydb

create table users (
	user_ID int primary key auto_increment,
    userName varchar(50) not null,
    Email varchar (50) not null , 
    Password varchar(50) not null
);

desc users;

insert into users (userName, Email, Password)
values('SKETCH', 'abhi123@gmail.com', 'abcd123'),
	  ('Deep', 'deep123@gmail.com', 'def456');
      
      
create table playlist(
		playlist_id int primary key auto_increment,
        playlist_Name varchar(50) not null,
        user_ID int not null,
        foreign key(user_ID) references users(user_ID)
);

insert into playlist(playlist_Name, user_ID)
values('UserPlaylist1', '1'),
	  ('UserPlaylist2', '2'),
	  ('UserPlaylist3', '3');


create table tracks(
	track_ID int primary key auto_increment,
    track_Name varchar(50) not null,
    artist_Name varchar(50) not null,
    album_Name varchar(50) not null,
    duration int not null,
    playlist_id int not null,
    foreign key (playlist_id) references playlist(playlist_id)
);

insert into tracks(track_Name, artist_Name, album_Name, duration, playlist_id)
values			  ('295', 'Sidhu moosewala', 'Moosetape', 430, 1),
                  ('3:59AM', 'DIVINE', 'Punya Paap', 432, 1),
                  ('Villain', 'KR$NA,Karma,Ikka', 'still here', 338, 1),
                  ('TERE TE', 'AP Dhillon', 'HIDDEN GEMS', 154, 2),
                  ('Baller', 'Shubh', 'Baller', 228, 2),
                  ('Never Fold', 'Sidhu Moosewala', 'No Name', 303, 2);
                  
insert into tracks(track_Name, artist_Name, album_Name, duration, playlist_id)
values			  ('Born to shine', 'Diljit Dosanjh', 'GOAT', 333, 3),
                  ('Angreji Beat', 'Yo Yo Honey Singh', 'International Villager', 416, 3);

desc users;
desc playlist;
desc tracks;


select *
from tracks
left join playlist on tracks.playlist_id = playlist.playlist_id
where playlist.user_ID = 1;

select *
from tracks
left join playlist on tracks.playlist_id = playlist.playlist_id;


select *
from tracks
left join playlist on tracks.playlist_id = playlist.playlist_id
where playlist.user_ID = 2;

select *
from tracks
right join playlist on tracks.playlist_id = playlist.playlist_id
where playlist.user_ID = 1;

select *
from tracks
right join playlist on tracks.playlist_id = playlist.playlist_id
where playlist.user_ID = 2;

select *
from tracks
right join playlist on tracks.playlist_id = playlist.playlist_id;


select *
from tracks
inner join playlist on tracks.playlist_id = playlist.playlist_id;




select * from tracks
where playlist_id = 1 or playlist_id = 2;

select * from tracks
where  playlist_id = 1 and artist_Name = 'Sidhu Moosewala';

select * from tracks
where track_ID between 1 and 5;

select avg (playlist_id)
from tracks;

select  (artist_Name) 
from tracks
group by artist_Name;

select distinct track_Name
from tracks;

select * from tracks
order by track_ID desc;

select * from tracks
order by track_ID asc;

select * from tracks
group by track_ID
having artist_Name = 'Sidhu Moosewala';



#wildcards

select * 
from tracks 
where artist_Name like 'S%';

select * 
from tracks 
where artist_Name like '%e';


#aggregate functions

select max(track_ID), track_ID
from tracks;

select max(track_ID)
from tracks
where track_ID < (select max(track_ID)
					from tracks	);
                    

select max(track_ID)
from tracks
where track_ID < (select max(track_ID) from tracks
					where track_ID <
                    (select max(track_ID)
						from tracks));

		
select min(track_ID)
from tracks
where track_ID > (select min(track_ID) from tracks
					where track_ID >
                    (select min(track_ID)
						from tracks));
                        
                        
                        
                        
                        
                        
select track_ID, track_Name,artist_Name
from tracks
where track_ID  in (select track_ID
					from tracks 
                    where playlist_id = 1 );

select track_ID, track_Name,artist_Name
from tracks
where track_ID  in (select track_ID
					from tracks 
                    where playlist_id = 2 and track_ID < 5 );
       

select track_ID, track_Name,artist_Name
from tracks
where track_ID = (select max(track_ID)
							from tracks);       
                            
select track_ID, track_Name,artist_Name
from tracks
where track_ID = (select max(track_ID)
							from tracks
						where track_ID = 6);       
                        
                        
                        
select track_ID, track_Name,artist_Name
from tracks
where track_ID not in (select track_ID
					from tracks 
                    where playlist_id = 1 );    
                    
select track_ID, track_Name,artist_Name
from tracks
where  exists (select *
					from tracks 
                    where playlist_id = 2 );  
                    
select track_ID, track_Name,artist_Name
from tracks
where  not exists (select *
					from tracks 
                    where playlist_id = 3 );                        
                    
select *
from playlist
where user_ID in (select user_ID 
						from users
						where user_ID = 1);