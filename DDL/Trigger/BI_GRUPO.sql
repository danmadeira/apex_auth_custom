PROMPT CREATE OR REPLACE TRIGGER bi_grupo
CREATE OR REPLACE TRIGGER bi_grupo   
  before insert on grupo               
  for each row  
begin
  if :NEW."GRUPO_ID" is null then
    select "GRUPO_SEQ".nextval into :NEW."GRUPO_ID" from sys.dual;
  end if;
end;
/

