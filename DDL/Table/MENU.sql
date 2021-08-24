PROMPT CREATE TABLE menu
CREATE TABLE menu (
  menu_id      NUMBER         NOT NULL,
  parent_id    NUMBER         NULL,
  pagina_id    NUMBER         NULL,
  label        VARCHAR2(30)   NOT NULL,
  ordem        NUMBER         NOT NULL,
  image_ref    VARCHAR2(255)  NULL,
  image_attrib VARCHAR2(1000) NULL,
  image_alt    VARCHAR2(1000) NULL,
  param_name   VARCHAR2(1000) NULL,
  param_value  VARCHAR2(1000) NULL
)
  STORAGE (
    NEXT       1024 K
  )
/


