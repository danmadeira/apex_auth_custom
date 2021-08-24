PROMPT ALTER TABLE usuario_grupo ADD CONSTRAINT usuario_grupo_id_fk FOREIGN KEY
ALTER TABLE usuario_grupo
  ADD CONSTRAINT usuario_grupo_id_fk FOREIGN KEY (
    grupo_id
  ) REFERENCES grupo (
    grupo_id
  )
/

PROMPT ALTER TABLE usuario_grupo ADD CONSTRAINT usuario_id_grupo_fk FOREIGN KEY
ALTER TABLE usuario_grupo
  ADD CONSTRAINT usuario_id_grupo_fk FOREIGN KEY (
    usuario_id
  ) REFERENCES usuario (
    usuario_id
  )
/

