#language:pt
@POST_Partners
Funcionalidade: POST /partners - Register

    #SUCESS FLOW
    @Sucess_Flow
    Cenario: Register cadastrado com sucesso

        Quando realizo uma requisição de Register
        Então status code retornado é 201
        E parametro "id" exibido no response body
        E parametro "admSecret" exibido no response body
        E parametro "secret" exibido no response body
        E parametro "networkCode" exibido no response body
        
    #ALTERNATIVE FLOW

    @Validacao_Header
    Esquema do Cenário: Validação de Header Params obrigatórios

        Quando realizo uma requisição de Register com o header param "<headerParam>" com o valor "<valor>"
        Então mensagem "<mensagem>" exibida no response body
        Então status code retornado é <statusCode>
        

        Exemplos:
            |headerParam             |valor |statusCode |mensagem                                                                                    |
            |Content-Type            |      |500        |Internal Server Error, please contact the support or try it again later.                    |
            |Content-Type            |null  |500        |Internal Server Error, please contact the support or try it again later.                    |
            |client_id_backoffice    |      |401        |Could not find a required APP in the request, identified by HEADER client_id                |
            |client_id_backoffice    |null  |401        |Could not find a required APP in the request, identified by HEADER client_id                |
            |access_token_backoffice |      |401        |Could not find a required Access Token in the request, identified by HEADER access_token    |
            |access_token_backoffice |null  |401        |Could not find a required Access Token in the request, identified by HEADER access_token    |

    @Validacao_Campos_Obrigatorios
    Esquema do Cenário: Validação de campos obrigatórios

        Quando realizo uma requisição de Register com o atributo "<atributo>" com o valor "<valor>"
        Então mensagem "<mensagem>" exibida no response body
        E código "<codigo>" exibido no response body
        E status code retornado é 412

        Exemplos:
            |atributo                     |valor |mensagem                                                               |codigo  |
            |logonType                    |      |Partner Logon Type is required, it must be NONE, EASY or SECRET.       |412.4   |
            |logonType                    |null  |Partner Logon Type is required, it must be NONE, EASY or SECRET.       |412.4   |
            |name                         |      |Partner name is invalid, it must be a word.                            |412.1   |
            |name                         |null  |Partner name is invalid, it must be a word.                            |412.1   |
            |onboarding                   |      |Partner Onboarding value is invalid, it must be INTERNAL or EXTERNAL.  |412.3   |
            |onboarding                   |null  |Partner Onboarding value is invalid, it must be INTERNAL or EXTERNAL.  |412.3   |
            |sessionValidSeconds          |      |Partner Session Valid Seconds is required.                             |412.5   |
            |sessionValidSeconds          |null  |Partner Session Valid Seconds is required.                             |412.5   |
            |provisioningLukType          |      |Provision LUK Type is invalid.                                         |412.12  |
            |provisioningLukType          |null  |Provision LUK Type is invalid.                                         |412.12  |
            |callbackUrl                  |      |Callback URL is required.                                              |412.29  |
            |callbackUrl                  |null  |Callback URL is required.                                              |412.26  |

    @Validacao_Campos_Invalidos
    Esquema do Cenário: Validação de campos com valores inválidos

        Quando realizo uma requisição de Register com o atributo "<atributo>" com o valor "<valor>"
        Então mensagem "<mensagem>" exibida no response body
        E código "<codigo>" exibido no response body
        E status code retornado é 412

        Exemplos:
            |atributo                  |valor      |mensagem                                                                       |codigo  |
            |logonType                 |XPTO123    |Partner Logon Type is required, it must be NONE, EASY or SECRET.               |412.4   |
            |name                      |123        |Partner name is invalid, it must be a word.                                    |412.1   |
            |onboarding                |XPTO123    |Partner Onboarding value is invalid, it must be INTERNAL or EXTERNAL.          |412.3   |
            |provisioningLukType       |XPTO123    |Provision LUK Type is invalid.                                                 |412.12  |
            |clearanceMode             |XPTO123    |clearanceMode it must be INCOMING or BYEXTRACTION.                             |412.30  |
            |certificates.0.expiration |2000-12-01 |Certificate expiration date invalid                                            |412.35  |  
            |certificates.0.usage      |XPTO123    |Certificate Usage value is invalid, it must be ENC, DEC, SIG, VER, SSL or CA.  |412.8   |


    @Validacao_Registro_Duplicado
    Esquema do Cenário: Validação de registro duplicado

        Quando realizo uma requisição de Register com o atributo "<atributo>" com o valor "<valor>"
        Quando realizo uma requisição de Register com o atributo "<atributo>" com o valor "<valor>"
        Então mensagem "<mensagem>" exibida no response body
        E código "<codigo>" exibido no response body
        E status code retornado é 422

        Exemplos:
            |atributo           |valor              |mensagem                             |codigo  |
            |name               |Partner Name Test  |Partner name already registered.     |422.2   |
