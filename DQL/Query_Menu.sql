SELECT LEVEL
     , label
     , CASE
         WHEN (pagina_id IS NULL) THEN
           NULL
         ELSE
           'f?p=&APP_ID.:' || pagina_id || ':' || :APP_SESSION || '::NO::' || param_name || ':'|| param_value
       END AS target
     , decode(:APP_PAGE_ID, pagina_id, 'YES', 'NO') AS is_current
     , image_ref AS image
     , image_attrib
     , image_alt
  FROM (
        SELECT DISTINCT m.menu_id
                      , m.parent_id
                      , m.pagina_id
                      , m.label
                      , m.ordem
                      , m.image_ref
                      , m.image_attrib
                      , m.image_alt
                      , m.param_name
                      , m.param_value
                   FROM menu m
                      , grupo_pagina gp
                      , usuario_grupo ug
                      , usuario u
                  WHERE (m.pagina_id IS NULL
                     OR (gp.pagina_id   = m.pagina_id
                    AND  ug.grupo_id    = gp.grupo_id
                    AND  ug.usuario_id  = u.usuario_id
                    AND  upper (u.nome) = upper (:APP_USER)))
       ) A
START WITH (parent_id = 0)
CONNECT BY PRIOR menu_id = parent_id
ORDER SIBLINGS BY ordem;