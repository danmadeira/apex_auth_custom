PROMPT ALTER TABLE grupo_pagina ADD CONSTRAINT grupo_pagina_pk PRIMARY KEY
ALTER TABLE grupo_pagina
  ADD CONSTRAINT grupo_pagina_pk PRIMARY KEY (
    grupo_id,
    pagina_id
  )
  USING INDEX
    STORAGE (
      NEXT       1024 K
    )
/

