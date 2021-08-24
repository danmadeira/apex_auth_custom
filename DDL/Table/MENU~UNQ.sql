PROMPT ALTER TABLE menu ADD CONSTRAINT menu_pk PRIMARY KEY
ALTER TABLE menu
  ADD CONSTRAINT menu_pk PRIMARY KEY (
    menu_id
  )
  USING INDEX
    STORAGE (
      NEXT       1024 K
    )
/

