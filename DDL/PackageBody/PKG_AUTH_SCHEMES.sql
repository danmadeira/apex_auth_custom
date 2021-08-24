PROMPT CREATE OR REPLACE PACKAGE BODY pkg_auth_schemes
CREATE OR REPLACE PACKAGE BODY pkg_auth_schemes
AS
  FUNCTION autenticar_usuario (p_username IN VARCHAR2, p_password IN VARCHAR2)
  RETURN BOOLEAN
  IS
    CURSOR c_usuario
    IS
    SELECT usuario_id
      FROM usuario
     WHERE upper (nome) = upper (p_username)
       AND senha        = p_password;

    l_usuario_id usuario.usuario_id%TYPE;
    l_found      BOOLEAN;

  BEGIN
    OPEN c_usuario;
    FETCH c_usuario INTO l_usuario_id;
    l_found := c_usuario%FOUND;
    CLOSE c_usuario;
    RETURN l_found;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN false;
  END autenticar_usuario;

  FUNCTION permitir_acesso (p_username IN VARCHAR2, p_page_id IN NUMBER)
  RETURN BOOLEAN
  IS
    CURSOR c_acesso
    IS
    SELECT u.usuario_id
      FROM usuario       u
         , usuario_grupo ug
         , grupo_pagina  gp
     WHERE upper (u.nome) = upper (p_username)
       AND u.usuario_id   = ug.usuario_id
       AND ug.grupo_id    = gp.grupo_id
       AND gp.pagina_id   = p_page_id;

    l_usuario_id usuario.usuario_id%TYPE;
    l_found      BOOLEAN;

  BEGIN
    OPEN c_acesso;
    FETCH c_acesso INTO l_usuario_id;
    l_found := c_acesso%FOUND;
    CLOSE c_acesso;
    RETURN l_found;

  EXCEPTION
    WHEN OTHERS THEN
      RETURN false;
  END permitir_acesso;

END pkg_auth_schemes;
/

