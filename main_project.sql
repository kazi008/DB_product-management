drop table it_order;
drop table credit_card;
drop table item;
drop table userinfo;

create table userinfo(
            user_id      number(15),
            us_email     varchar(30) UNIQUE,
            username     varchar(10),
            contact_no   number(20),
            address      varchar(10),
        PRIMARY KEY (user_id)
);

create table credit_card(
            cc_id        integer,
            cc_expiry    date,
            user_id      number(15),
            cc_type      varchar(10),
        PRIMARY KEY (cc_id),
        FOREIGN KEY (user_id) REFERENCES userinfo(user_id) on DELETE CASCADE
);


create table item(
	        it_id	     number(10),
	        it_name      varchar(15),
	        price	     number(10),
        	category     varchar(10),
	    PRIMARY KEY (it_id)
);


create table it_order(
	        it_id	     number(10),
            order_date   date,
	        order_type   char(10) check(order_type in('Sell', 'Buy')),
            cc_id        integer,
        FOREIGN KEY (it_id) REFERENCES item(it_id) on DELETE CASCADE,
        FOREIGN KEY (cc_id) REFERENCES credit_card(cc_id) on DELETE CASCADE
);
            

describe userinfo;
describe credit_card;
describe item;
describe it_order;


CREATE OR REPLACE TRIGGER check_price BEFORE INSERT OR UPDATE ON item
FOR EACH ROW
DECLARE
   c_min constant number(8,2) := 200.0;
   c_max constant number(8,2) := 500000.0;
BEGIN
  IF :new.price > c_max OR :new.price < c_min THEN
  RAISE_APPLICATION_ERROR(-20000,'New price is too small or large');
END IF;
END;
/



INSERT INTO userinfo VALUES ('1107001',  'shubashis.karmo@gmail.com', 'shubashis', 01674839284, 'dhaka') ;
INSERT INTO userinfo VALUES ('1107002',  'sun.kuet@yahoo.com', 'sun', 01612233574, 'rangpur' ) ;
INSERT INTO userinfo VALUES ('1107010',  'suhail223.kuet@yahoo.com', 'suhail', 01614433574, 'borishal' ) ;
INSERT INTO userinfo VALUES ('1107006',   'jishan@gmail.com', 'jishan', 01628665433, 'chittagong' )  ;
INSERT INTO userinfo VALUES ('1107007',  'surid007@hotmail.com', 'surid', 01674124432, 'khulna' ) ;
INSERT INTO userinfo VALUES ('1107008',  'kazi.sazid@gmail.com', 'sazid', 01670239284, 'mymensingh' ) ;
INSERT INTO userinfo VALUES ('1107004',  'rashik_hasnat@yahoo.com', 'othoi', 01612231124, 'dhaka' ) ;
INSERT INTO userinfo VALUES ('1107005',  'rumi005@yahoo.com', 'rumi', 01731233574, 'khulna' ) ;
INSERT INTO userinfo VALUES ('1107012',  'musta889@yahoo.com', 'mustafiz', 01913233574, 'joshore' ) ;
INSERT INTO userinfo VALUES ('1107046',  'badhon_bb@yahoo.com', 'badhon', 01600233574, 'comilla' ) ;
INSERT INTO userinfo VALUES ('1107014',  'hasnain.kuet@gmail.com', 'fahim', 01912983574, 'khulna' ) ;
INSERT INTO userinfo VALUES ('1107015',  'dip.mojumder@gmail.com', 'dip', 01612233023, 'chittagong' ) ;
INSERT INTO userinfo VALUES ('1107049',  'irtiza_pko@hotmail.com', 'irtiza', 01990433574, 'dhaka' ) ;
INSERT INTO userinfo VALUES ('1107017',  'peal@yahoo.com', 'peal', 01612210674, 'chandpur' ) ;
INSERT INTO userinfo VALUES ('1107018',  'emtious_kuet218@gmail.com', 'emtious', 01551233574, 'mymensingh' ) ;
INSERT INTO userinfo VALUES ('1107048',  'bingoo_48@hotmail.com', 'tanvir', 01550231574, 'borishal' ) ;


INSERT INTO credit_card VALUES ( 1101, '01-NOV-2030', 1107001, 'SOLO' );
INSERT INTO credit_card VALUES ( 0702, '01-DEC-2025', 1107002, 'DISCOVER' );
INSERT INTO credit_card VALUES ( 0710, '21-NOV-2020', 1107010, 'VISA' );
INSERT INTO credit_card VALUES ( 0706, '01-JAN-2023', 1107006, 'VISA' );
INSERT INTO credit_card VALUES ( 1107, '30-NOV-2030', 1107007, 'DISCOVER' );
INSERT INTO credit_card VALUES ( 0708, '11-NOV-2020', 1107008, 'MASTERCARD' );
INSERT INTO credit_card VALUES ( 0704, '01-NOV-2015', 1107004, 'MAESTRO' );
INSERT INTO credit_card VALUES ( 1115, '31-DEC-2030', 1107015, 'ATM' );
INSERT INTO credit_card VALUES ( 0714, '17-JUL-2019', 1107014, 'ATM' );
INSERT INTO credit_card VALUES ( 0712, '01-JUN-2028', 1107012, 'SOLO' );
INSERT INTO credit_card VALUES ( 1105, '01-JUN-2028', 1107005, 'VISA' );
INSERT INTO credit_card VALUES ( 1149, '01-JUN-2028', 1107049, 'DISCOVER' );
INSERT INTO credit_card VALUES ( 1117, '01-JUN-2028', 1107017, 'MASTERCARD' );
INSERT INTO credit_card VALUES ( 0718, '01-JUN-2028', 1107018, 'MASTERCARD' );
INSERT INTO credit_card VALUES ( 0748, '01-JUN-2028', 1107048, 'SOLO' );
INSERT INTO credit_card VALUES ( 0746, '31-DEC-2030', 1107046, 'ATM' );


INSERT INTO item VALUES ( 1, 'M 203', 2000, 'speaker' ) ;
INSERT INTO item VALUES ( 2, 'laptop_cooler', 950, 'cooler' ) ;
INSERT INTO item VALUES ( 3, 'a4tech', 200, 'mouse' ) ;
INSERT INTO item VALUES ( 4, 'banglalion', 2300, 'modem') ;
INSERT INTO item VALUES ( 5, 'tmn1',3000 , 'speaker') ;
INSERT INTO item VALUES ( 6, 'transcend',700 , 'pendrive') ;
INSERT INTO item VALUES ( 7, 'apache',850 , 'pendrive') ;
INSERT INTO item VALUES ( 8, 'M 230',3500 , 'speaker') ;
INSERT INTO item VALUES ( 9, 'symphoni w65i',5300 , 'mobile') ;
INSERT INTO item VALUES ( 10, 'dell mopnitor',8000 , 'monitor') ;
INSERT INTO item VALUES ( 11, 'teletalk',2500 , 'modem') ;
INSERT INTO item VALUES ( 12, 'banglalion',2300 , 'modem') ;
INSERT INTO item VALUES ( 13, 'tmn1',3000 , 'speaker') ;
INSERT INTO item VALUES ( 14, 'nokia 1100',500 , 'mobile') ;
INSERT INTO item VALUES ( 15, 'dell 4110',43000 , 'laptop') ;
INSERT INTO item VALUES ( 16, 'transcend',2500 , 'pendrive') ;


INSERT INTO it_order VALUES (  2, '29-NOV-2014', 'Sell', 1101 ) ;
INSERT INTO it_order VALUES (  3, '23-JUN-2014', 'Buy', 0746 ) ;
INSERT INTO it_order VALUES (  1, '19-JUN-2014', 'Buy', 0702 ) ;
INSERT INTO it_order VALUES (  4, '09-JAN-2014', 'Sell', 1101 ) ;
INSERT INTO it_order VALUES (  5, '19-JUL-2014', 'Buy', 0710 ) ;
INSERT INTO it_order VALUES (  16, '01-NOV-2014', 'Buy', 0708 ) ;
INSERT INTO it_order VALUES (  15, '09-JAN-2014', 'Sell', 0706 ) ;
INSERT INTO it_order VALUES (  10, '28-FEB-2014', 'Sell', 1117 ) ;
INSERT INTO it_order VALUES (  12, '21-MAR-2014', 'Buy', 1107 ) ;
INSERT INTO it_order VALUES (  8, '10-APR-2014', 'Buy', 0702 ) ;
INSERT INTO it_order VALUES (  6, '17-AUG-2014', 'Buy', 0708 ) ;
INSERT INTO it_order VALUES (  13, '29-SEP-2014', 'Sell', 0702 ) ;
INSERT INTO it_order VALUES (  14, '13-OCT-2014', 'Buy', 0704 ) ;
INSERT INTO it_order VALUES (  7, '14-DEC-2014', 'Sell', 0708 ) ;
INSERT INTO it_order VALUES (  11, '04-NOV-2014', 'Sell', 0714 ) ;
INSERT INTO it_order VALUES (  9, '02-JAN-2014', 'Buy', 0708 ) ;

COMMIT;


select * from userinfo;
select * from credit_card;
select * from item;
select * from it_order;


select COUNT(DISTINCT username) as number_of_user from userinfo;


select COUNT(it_id) as number_item_ordered_by_sazid from it_order where cc_id in 
(select cc_id from credit_card where user_id in 
(select user_id from userinfo where username='sazid'));


select user_id,username as speker_buyer from userinfo where user_id in 
(select user_id from credit_card where cc_id in 
(select cc_id from it_order where it_id in 
(select it_id from item where	category='modem' )));


select it_name,category,price from item order by price;

select username,address,order_type from userinfo natural join credit_card natural join it_order order by order_type;

select u.username,c.cc_id,c.cc_type from userinfo u join credit_card c using(user_id);


select u.username,c.cc_type,i.it_name from userinfo u inner join credit_card c 
    on c.user_id=u.user_id inner join it_order it 
    on it.cc_id=c.cc_id inner join item i
    on i.it_id=it.it_id order by username DESC;



select u.username,u.us_email,u.contact_no from userinfo u where address='dhaka'
INTERSECT
select u.username,u.us_email,u.contact_no from userinfo u where u.user_id in 
(select c.user_id from credit_card c where c.cc_id in 
(select it.cc_id from it_order it where it.it_id in 
(select i.it_id from item i where i.it_id=it.it_id and category='modem' )));



select u.username,u.us_email,u.contact_no from userinfo u where address='dhaka'
UNION
select u.username,u.us_email,u.contact_no from userinfo u where u.user_id in 
(select c.user_id from credit_card c where c.cc_id in 
(select it.cc_id from it_order it where it.it_id in 
(select i.it_id from item i where i.it_id=it.it_id and category='modem' )));




SET SERVEROUTPUT ON
DECLARE
   itname item.it_name%type;
BEGIN
   SELECT it_name into itname from item where price=200;  
   DBMS_OUTPUT.PUT_LINE('TK200 is the price of : ' || itname);
 END;
/



CREATE OR REPLACE PROCEDURE add_item (
  itemid item.it_id%TYPE,
  itemname item.it_name%TYPE,
  itemprice item.price%TYPE,
  itemcategory item.category%TYPE) IS
BEGIN
  INSERT INTO item (it_id, it_name, price, category)
  VALUES (itemid, itemname, itemprice, itemcategory);
  COMMIT;
END add_item;
/
SHOW ERRORS


BEGIN
    add_item (23, 'L 125', 2650, 'speaker' );
 END;
/




CREATE OR REPLACE PROCEDURE UPD_ADD (itemid item.it_id%TYPE, itemname item.it_name%TYPE) IS
BEGIN
    update item set it_name=itemname where it_id=itemid;
 END UPD_ADD;
/


BEGIN
    UPD_ADD (23, 'M 250');

    	IF SQL%NOTFOUND THEN
        RAISE_APPLICATION_ERROR(-20202, 'No job updated.');
        END IF;
END;
/



CREATE OR REPLACE FUNCTION get_price(itemid item.it_id%type) RETURN varchar2 Is
itprice item.price%type;
begin
     select price into itprice from item where it_id=itemid;
     return itprice;

end;
/


VARIABLE title varchar2(15)
EXECUTE :title := get_price (1);
PRINT :title;


SET SERVEROUTPUT ON
DECLARE 

fst_record userinfo.username%TYPE;
scnd_record userinfo.contact_no%TYPE;
thrd_record userinfo.address%TYPE;

CURSOR fst_row IS SELECT username, contact_no, address from userinfo;

BEGIN
  OPEN fst_row;
  LOOP 
    FETCH fst_row into fst_record,scnd_record,thrd_record ;
    EXIT WHEN fst_row%ROWCOUNT>10;
    DBMS_OUTPUT.put_line(fst_record || '     ' || scnd_record || '     ' || thrd_record);
    
  END LOOP;
    CLOSE fst_row;   
END;
/


SELECT user_id,floor((cc_expiry-sysdate))
          || ' DAYS TO GO'  credit_card_expiry
FROM credit_card;


