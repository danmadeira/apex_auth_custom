PROMPT ALTER TABLE usuario_grupo ADD CONSTRAINT usuario_grupo_pk PRIMARY KEY
ALTER TABLE usuario_grupo
  ADD CONSTRAINT usuario_grupo_pk PRIMARY KEY (
    usuario_id,
    grupo_id
  )
  USING INDEX
    STORAGE (
      NEXT       1024 K
    )
/

