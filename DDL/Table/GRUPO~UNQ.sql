PROMPT ALTER TABLE grupo ADD CONSTRAINT grupo_pk PRIMARY KEY
ALTER TABLE grupo
  ADD CONSTRAINT grupo_pk PRIMARY KEY (
    grupo_id
  )
  USING INDEX
    STORAGE (
      NEXT       1024 K
    )
/

