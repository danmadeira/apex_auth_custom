PROMPT ALTER TABLE pagina ADD CONSTRAINT pagina_pk PRIMARY KEY
ALTER TABLE pagina
  ADD CONSTRAINT pagina_pk PRIMARY KEY (
    pagina_id
  )
  USING INDEX
    STORAGE (
      NEXT       1024 K
    )
/

