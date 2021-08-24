PROMPT CREATE OR REPLACE TRIGGER bi_usuario
CREATE OR REPLACE TRIGGER bi_usuario   
  before insert on usuario               
  for each row  
begin
  if :NEW."USUARIO_ID" is null then
    select "USUARIO_SEQ".nextval into :NEW."USUARIO_ID" from sys.dual;
  end if;
end;
/

