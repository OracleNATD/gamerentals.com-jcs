alter table order_details
drop constraint fk_loc;

Drop table DeliveryLocations;

alter table order_details
drop column order_loc_id;

CREATE OR REPLACE EDITIONABLE PROCEDURE "ADD_ORDER" ( user_id IN NUMBER, user_realname IN VARCHAR2, user_address IN VARCHAR2, user_phone In NUMBER, user_email IN VARCHAR2, order_price IN NUMBER)
IS
BEGIN
  INSERT INTO order_details(order_id, user_id, status, shippers_name, address, MOBILE_NUMBER,SHIPPERS_EMAIL,ORDERED_ON,TOTAL_ORDER_PRICE) VALUES(
    SYS_GUID(),
    user_id,
    'paid',
    user_realname,
    user_address,
    user_phone,
    user_email,
    CURRENT_DATE,
    order_price
  );
END;