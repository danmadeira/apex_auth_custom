PROMPT CREATE OR REPLACE PACKAGE pkg_auth_schemes
CREATE OR REPLACE PACKAGE pkg_auth_schemes
AS
  FUNCTION autenticar_usuario (p_username IN VARCHAR2, p_password IN VARCHAR2) RETURN BOOLEAN;
  FUNCTION permitir_acesso    (p_username IN VARCHAR2, p_page_id  IN NUMBER)   RETURN BOOLEAN;
END;
/

