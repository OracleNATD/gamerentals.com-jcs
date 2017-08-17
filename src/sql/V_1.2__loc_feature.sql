
--alter table order_details
--drop constraint fk_loc;

--drop table webapp.DeliveryLocations;


create table DeliveryLocations(
  loc_id number(2) PRIMARY KEY,
  loc_name varchar2(50) NOT NULL
) ;


INSERT INTO "DELIVERYLOCATIONS" (LOC_ID, LOC_NAME) VALUES ('1', 'SF Bay Area');
INSERT INTO "DELIVERYLOCATIONS" (LOC_ID, LOC_NAME) VALUES ('2', 'New York City');
INSERT INTO "DELIVERYLOCATIONS" (LOC_ID, LOC_NAME) VALUES ('3', 'Miami');
INSERT INTO "DELIVERYLOCATIONS" (LOC_ID, LOC_NAME) VALUES ('4', 'Seattle');
INSERT INTO "DELIVERYLOCATIONS" (LOC_ID, LOC_NAME) VALUES ('5', 'Austin');

alter table order_details
add order_loc_id number(5);

alter table order_details
add constraint fk_loc
  FOREIGN KEY (order_loc_id)
  REFERENCES DeliveryLocations(loc_id);


create or replace PROCEDURE  add_order( user_id IN NUMBER, user_realname IN VARCHAR2, user_address IN VARCHAR2, user_phone In NUMBER, user_email IN VARCHAR2, order_price IN NUMBER, loc_id IN NUMBER)
IS
BEGIN
  INSERT INTO order_details(order_id, user_id, status, shippers_name, address, MOBILE_NUMBER,SHIPPERS_EMAIL,ORDERED_ON,TOTAL_ORDER_PRICE, ORDER_LOC_ID) VALUES(
    SYS_GUID(),
    user_id,
    'paid',
    user_realname,
    user_address,
    user_phone,
    user_email,
    CURRENT_DATE,
    order_price,
    loc_id
  );
END;
