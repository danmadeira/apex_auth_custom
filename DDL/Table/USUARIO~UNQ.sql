PROMPT ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY
ALTER TABLE usuario
  ADD CONSTRAINT usuario_pk PRIMARY KEY (
    usuario_id
  )
  USING INDEX
    STORAGE (
      NEXT       1024 K
    )
/

