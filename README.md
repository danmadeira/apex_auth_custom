## Como fazer uma autenticação e autorização customizada no Oracle APEX

Uma aplicação Oracle APEX vem, por padrão, com o controle de autenticação e de autorização de acesso próprios do Workspace. Assim também, a lista do menu de navegação. Entretanto, é possível customizar estas funções e implementar soluções personalizadas. Aqui será mostrado como implementar um controle de login, um controle de acesso e um menu dinâmico, tudo consultando uma base personalizada.

### O que é Oracle APEX?

O Oracle Application Express (APEX) é uma plataforma de desenvolvimento que permite criar aplicativos web escaláveis e seguros sem depender de muita codificação. Conta com as melhores funcionalidades e possui muitos recursos para qualquer tipo de aplicação.

Sua grande vantagem é que o desenvolvedor não precisa dedicar (ou perder) muito tempo para montar a estrutura básica de uma aplicação, partindo logo para o desenvolvimento específico da aplicação.

### Base de dados de exemplo

Aqui, neste repositório, estão os scripts DDL das estruturas das tabelas para aplicação deste tutorial e um script DML para a massa de dados de exemplo. Como bônus, há a organização dos usuários em grupos de acesso às páginas, desenvolvendo uma lógica um pouco mais complexa.

### Authentication Scheme

Para implementar um controle de login, navegue até a seção **Application \ Shared Components \ Authentication Schemes**. Pode-se editar o esquema já existente (*Application Express Authentication*) ou criar um novo esquema e torná-lo ativo (*current*). Em qualquer uma das opções, basta definir:

**Scheme Type** = Custom

**Authentication Function Name** = pkg_auth_schemes.autenticar_usuario

Obs: O pacote *pkg_auth_schemes* está fornecido aqui neste repositório.

Para usar este esquema, em cada página que terá o controle, caso não seja pública, vá até a seção **Page \ Security** e defina **Authentication** = Page Requires Authentication.

![Authentication Schemes](img/APEX_Authentication_Scheme.png?raw=true)

### Authorization Scheme

Para implementar o controle de acesso às páginas, navegue até a seção **Application \ Shared Components \ Authorization Schemes**. Crie um esquema (*From Scratch*) e defina:

**Name** = Permitir Acesso

**Scheme Type** = PL/SQL Function Returning Boolean

**PL/SQL Function Body** = 

```sql
BEGIN
  RETURN pkg_auth_schemes.permitir_acesso(:APP_USER,:APP_PAGE_ID);
END;
```

**Identify error message displayed when scheme violated** = Desculpe, você não tem permissão para acessar esta página.

**Validate authorization scheme** = Always (No Caching)

Obs: O pacote *pkg_auth_schemes* está fornecido aqui neste repositório.

Para usar este esquema, em cada página que terá o controle, vá até a seção **Page \ Security** e defina **Authorization Scheme** = Permitir Acesso.

![Authorization Schemes](img/APEX_Authorization_Scheme.png?raw=true)

### Navigation Menu

Para implementar um menu de navegação dinâmico, navegue até a seção **Application \ Shared Components \ Navigation Menu**. Crie uma nova lista (*From Scratch*) e defina:

**Name** = Menu Dinamico

**Type** = Dynamic

**Query Source Type** = SQL Query

**Query** = (copie e cole o conteúdo do aquivo [Query_Menu.sql](DQL/Query_Menu.sql?raw=true))

Depois, navegue até a seção **Application \ Shared Components \ User Interface Attributes \ Navigation Menu** e defina:

**Navigation Menu List** = Menu Dinamico

**Template Options - Use Template Defaults** = não (*opcional*)

**Collapsed by Default (Default)** = não (*opcional*)

![Navigation Menu List](img/APEX_List_Menu.png?raw=true)

![User Interface Attributes](img/APEX_User_Interface.png?raw=true)

### Considerações

Estes exemplos estão um tanto simplistas e não estão adotando as boas práticas de segurança da informação como, por exemplo, senhas em hash. Desta forma, use apenas como base e aprimore conforme a necessidade. Contudo, todas as soluções são de fácil implementação no Oracle APEX e completamente suficientes para garantir a segurança da aplicação. O Oracle APEX possui uma estrutura muito bem montada e confiável.

### Referências

- GODFREY, J. et col. *Oracle Application Express API Reference, Release 21.1*. Oracle, July 2021.

- GODFREY, J.; JENNINGS, T. et col. *Oracle Application Express Administration Guide, Release 21.1*. Oracle, June 2021.

- GODFREY, J.; KONAKONDLA, H. et col. *Oracle Application Express SQL Workshop Guide, Release 21.1*. Oracle, May 2021.

- JENNINGS, T. et col. *Oracle Application Express App Builder User's Guide, Release 21.1*. Oracle, July 2021.
