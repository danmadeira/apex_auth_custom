PROMPT CREATE TABLE usuario
CREATE TABLE usuario (
  usuario_id NUMBER        NOT NULL,
  nome       VARCHAR2(100) NOT NULL,
  senha      VARCHAR2(100) NOT NULL
)
  STORAGE (
    NEXT       1024 K
  )
/


