PROMPT CREATE OR REPLACE TRIGGER bi_menu
CREATE OR REPLACE TRIGGER bi_menu   
  before insert on menu               
  for each row  
begin
  if :NEW."MENU_ID" is null then
    select "MENU_SEQ".nextval into :NEW."MENU_ID" from sys.dual;
  end if;
end;
/

