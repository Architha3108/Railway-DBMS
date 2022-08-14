create database Railway;
use Railway;

create table USER(user_id int primary key,first_name varchar(50),last_name varchar(50),adhar_no varchar(20), gender char,age int,mobile_no varchar(50),email varchar(50),city varchar(50), state varchar(50),pincode varchar(20), password varchar(50), security_ques varchar(50),security_ans varchar(50));
desc USER;

create table TRAIN(train_no int primary key,train_name varchar(50), arrival_time time,departure_time time,availability_of_seats char, date date);
desc TRAIN;

create table STATION(station_no int,name varchar(50),hault int,arrival_time time,train_no int, primary key(station_no,train_no),foreign key(train_no) references TRAIN(train_no));
desc STATION;

create table TRAIN_STATUS(train_no int primary key,b_seats1 int,b_seats2 int,a_seats1 int,a_seats2 int,w_seats1 int,w_seats2 int,fare1 float, fare2 float);
desc TRAIN_STATUS;

create table TICKET(id int primary key,user_id int,status char,no_of_passengers int,train_no int,foreign key(user_id) references USER(user_id),foreign key(train_no) references TRAIN(train_no)); 
desc TICKET;

create table PASSENGER (passenger_id int primary key,pnr_no int,age int,gender char,user_id int,reservation_status char,seat_number varchar(5),name varchar(50), id int,foreign key(user_id) references USER(user_id),foreign key(id) references TICKET(id));
desc PASSENGER;

create table STARTS(train_no int primary key,station_no int,foreign key(train_no) references TRAIN(train_no),foreign key(station_no) references STATION(station_no));
desc STARTS;

create table STOPS_AT( train_no int,station_no int,foreign key(train_no) references TRAIN(train_no),foreign key(station_no) references STATION(station_no));
desc STOPS_AT;

create table REACHES(train_no int,station_no int,time time,foreign key(train_no) references TRAIN(train_no),foreign key(station_no) references STATION(station_no));
desc REACHES;

create table BOOKS( user_id int,id int,foreign key(user_id) references USER(user_id),foreign key(id) references TICKET(id)); 
desc BOOKS;

create table CANCEL (user_id int,id int,passenger_id int,foreign key(id) references TICKET(id),foreign key(passenger_id) references PASSENGER(passenger_id), foreign key(user_id) references USER(user_id));
desc CANCEL;

insert into USER values(1701, 'vijay', 'sharma', '309887340843', 'M',34,'9887786655','vijay1@gmail.com', 'Bengaluru', 'Karnataka', '560041','12345@#', 'favouritecolour', 'red');
insert into USER values(1702,'rohith', 'kumar', '456709871234', 'M',45,'9809666555', 'rohith 1kumar@gmail.com', 'Koppal', 'Karnataka', '583231', '12@#345', 'favouritebike','bmw');
insert into USER values(1703,'manasvi', 'sree', '765843210987', 'F',20,'9995550666', 'manasvi57@gmail.com', 'Dharwad', 'Karnataka','580001','0987hii', 'favourite flower','rose'); 
insert into USER values(1704, 'anushka', 'sharma', '309887340643', 'F',34,'9887786655','anushka1@gmail.com', 'Raichur', 'Karnataka', '584101','12345@#', 'favouritecolour', 'blue');
insert into USER values(1705, 'ajay', 'kumar', '309887440843', 'M',34,'9881286655','ajay12@gmail.com', 'Hubballi', 'Karnataka', '580009','12345@#', 'favouritecolour', 'purple');
insert into USER values(1706, 'varun', 'agarwal', '309287340843', 'M',34,'6587786655','varun21@gmail.com', 'Gulbarga', 'Karnataka', '520010','12345@#', 'favouritecolour', 'white');
insert into USER values(1707, 'veena', 'kapoor', '309887390843', 'F',34,'9884386655','veena43@gmail.com', 'Madikeri', 'Karnataka', '520009','12345@#', 'favouritecolour', 'black');
insert into USER values(1708, 'vikas', 'rao', '303887340843', 'M',34,'8787786655','vikas99@gmail.com', 'Mysuru', 'Karnataka', '520008','12345@#', 'favouritecar', 'Lamborghini');
insert into USER values(1709, 'khushi', 'chopra', '309887540843', 'F',34,'9800786655','khushi31@gmail.com', 'Thirthahalli', 'Karnataka', '520007','12345@#', 'favouritecolour', 'Green');
insert into USER values(1710, 'kiara', 'sharam', '309837340843', 'F',34,'9113786655','kiara00@gmail.com', 'Udupi', 'Karnataka', '520006','12345@#', 'favouritecolour', 'Brown');
select * from USER;

insert into TRAIN values(12711,'pinakini exp', '113000', '114000','A',20220810);
insert into TRAIN values(12315,'cormandel exp', '124500','125000', 'N',20220810);
insert into TRAIN values(12316,'Hampi exp', '124511','125000', 'A',20220811);
insert into TRAIN values(12317,'Hubballi exp', '124612','125000', 'N',20220811);
insert into TRAIN values(12318,'Yeshwantpur exp', '122500','123000', 'A',20220812);
insert into TRAIN values(12319,'Jaipur exp', '120500','121000', 'N',20220812);
insert into TRAIN values(53891,'Dharwad exp', '120500','121000', 'A',20220812);
insert into TRAIN values(16789,'Delhi exp', '122500','123000', 'N',20220813);
insert into TRAIN values(12312,'Guntkal exp', '123200','123700', 'A',20220813);
insert into TRAIN values(12313,'ladakh exp', '121100','122000', 'N',20220814);
select * from TRAIN;

insert into STATION values(111, 'vijayawada', 10, '113000',12711);
insert into STATION values(222, 'tirupathi',5, '114500',12315);
insert into STATION values(333, 'goa', 15, '104600',12316);
insert into STATION values(444, 'mumbai', 10, '113500',12317);
insert into STATION values(555, 'ooty', 5, '123000',12318);
insert into STATION values(666, 'manali', 15, '104000',12319);
insert into STATION values(777, 'chennai', 5, '123500',53891);
insert into STATION values(888, 'pondicherry', 10, '115000',16789);
insert into STATION values(999, 'thiruvananthapuram', 15, '112000',12312);
insert into STATION values(000, 'chandhigarh', 5, '115500',12313);
select * from STATION;

insert into TRAIN_STATUS values(12711,10,4,0,1,1,0,100,450);
insert into TRAIN_STATUS values(12315,10,5,0,0,2,1,300,600); 
insert into TRAIN_STATUS values(12316,10,6,0,1,1,7,400,500); 
insert into TRAIN_STATUS values(12317,10,7,0,3,3,5,500,700); 
insert into TRAIN_STATUS values(12318,10,8,0,2,2,3,600,800); 
insert into TRAIN_STATUS values(12319,10,9,0,0,1,8,200,300); 
insert into TRAIN_STATUS values(53891,10,2,0,0,5,4,700,900); 
insert into TRAIN_STATUS values(16789,10,2,0,6,6,9,800,850); 
insert into TRAIN_STATUS values(12312,10,1,0,5,8,2,150,250); 
insert into TRAIN_STATUS values(12313,10,3,0,4,9,1,250,600); 
select * from TRAIN_STATUS;

insert into TICKET values(4001,1701,'C',1,12711);
insert into TICKET values(4002,1702, 'N',1,12315);
insert into TICKET values(4003,1703, 'C',1,12316);
insert into TICKET values(4004,1704, 'N',1,12317);
insert into TICKET values(4005,1705, 'C',1,12318);
insert into TICKET values(4006,1706, 'N',1,12319);
insert into TICKET values(4007,1707, 'C',1,53891);
insert into TICKET values(4008,1708, 'N',1,16789);
insert into TICKET values(4009,1709, 'C',1,12312);
insert into TICKET values(4010,1710, 'N',1,12313);
select * from TICKET;

insert into PASSENGER values(5001,78965,45, 'M',1701, 'C','B6-45', 'ramesh',4001);
insert into PASSENGER values(5003,54523,54, 'F',1702, 'W','B3-21','surekha',4002);
insert into PASSENGER values(5004,54523,19, 'M',1703, 'W','B4-20','rahul',4003);
insert into PASSENGER values(5005,54523,50, 'F',1704, 'C','B5-32','lalita',4004);
insert into PASSENGER values(5006,54523,23, 'M',1705, 'W','B3-43','rohan',4005);
insert into PASSENGER values(5007,54523,96, 'F',1706, 'C','B6-14','alia',4006);
insert into PASSENGER values(5008,54523,33, 'M',1707, 'C','B6-05','aryan',4007);
insert into PASSENGER values(5009,54523,21, 'F',1708, 'W','B7-46','aadya',4008);
insert into PASSENGER values(5010,54523,30, 'M',1709, 'C','B8-17','ayushman',4009);
insert into PASSENGER values(5002,54523,44, 'F',1710, 'W','B9-28','sakshi',4010);
select * from PASSENGER;

insert into STARTS values(12711,111);
insert into STARTS values(12315,222);
insert into STARTS values(12316,333);
insert into STARTS values(12317,444);
insert into STARTS values(12318,555);
insert into STARTS values(12319,666);
insert into STARTS values(53891,777);
insert into STARTS values(16789,888);
insert into STARTS values(12312,999);
insert into STARTS values(12313,000);
select * from STARTS;

insert into STOPS_AT values(12711,222);
insert into STOPS_AT values(12315,111); 
insert into STOPS_AT values(12316,444); 
insert into STOPS_AT values(12317,333); 
insert into STOPS_AT values(12318,666); 
insert into STOPS_AT values(12319,555); 
insert into STOPS_AT values(53891,777); 
insert into STOPS_AT values(16789,888); 
insert into STOPS_AT values(12312,000); 
insert into STOPS_AT values(12313,999); 
select * from STOPS_AT;

insert into REACHES values(12711,222,'040000');
insert into REACHES values(12315,111,'053500');
insert into REACHES values(12316,444,'033500');
insert into REACHES values(12317,333,'083000');
insert into REACHES values(12318,666,'103500');
insert into REACHES values(12319,555,'111000');
insert into REACHES values(53891,777,'050500');
insert into REACHES values(16789,888,'043500');
insert into REACHES values(12312,000,'050000');
insert into REACHES values(12313,999,'073500');
select * from REACHES;

insert into BOOKS values(1701,4001);
insert into BOOKS values(1702,4002);
insert into BOOKS values(1703,4003);
insert into BOOKS values(1704,4004);
insert into BOOKS values(1705,4005);
insert into BOOKS values(1706,4006);
insert into BOOKS values(1707,4007);
insert into BOOKS values(1708,4008);
insert into BOOKS values(1709,4009);
insert into BOOKS values(1710,4010);
select * from BOOKS;

insert into CANCEL values(1701,4001,5001);
insert into CANCEL values(1703,4003,5003);
insert into CANCEL values(1705,4005,5005);
select * from CANCEL;




/*QUERY1-SIMPLE-Print user id and name of all those user who booked ticket for pinakini express*/
select u.user_id,concat(u.first_name,u.last_name)as name from USER u,TRAIN t, TICKET tc where u.user_id=tc.user_id and t.train_no=tc.train_no and t.train_name like 'pinakini exp';

/*QUERY2-SIMPLE-Print details of passengers travelling under ticket no 4001 SIMPLE*/
select *from PASSENGER where id like 4001;

/*QUERY3-SIMPLE-Display details of all those passengers whose status is confirmedfor train no--- SIMPLE*/
select t.* from TICKET t where t.status like 'C' and t.train_no=12711;

/*QUERY4-updated BOOKS table after cancellation*/
delete from BOOKS b where b.user_id in ( select c.user_id from CANCEL c, USER u where c.user_id=u.user_id);
desc BOOKS;
select *from BOOKS;


/*QUERY5-COMPLEX-Display details of trains that arrive in time period around 12*/
Select * from TRAIN t join STATION s on s.train_no = t.train_no where s.arrival_time like "12%";

/*QUERY6-COMPLEX-Display passenger details for train Pinakini*/
select p.* from PASSENGER p,TRAIN t,TICKET tc where tc.train_no=t.train_no and tc.id=p.id and t.train_name like 'pinakini exp';