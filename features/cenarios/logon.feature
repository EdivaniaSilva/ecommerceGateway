#language:pt
@POST_requestors_{requestorId}_logon
Funcionalidade: POST /requestors/{requestorId}/logon - Logon

    Contexto: Register e Onbording

        Dado que realizo uma requisição de Register
        E que realizo uma requisição de Onbording

    #SUCESS FLOW
    @Sucess_Flow
    Cenario: Logon realizado com sucesso

        Quando realizo uma requisição de Logon
        Então status code retornado é 201
        E parametro "accessToken" exibido no response body

        
    #ALTERNATIVE FLOW

    @Validacao_Header
    Esquema do Cenário: Validação de Header Params obrigatórios

        Quando realizo uma requisição de Logon com o header param "<headerParam>" com o valor "<valor>"
        Então mensagem "<mensagem>" exibida no response body
        Então status code retornado é <statusCode>
        

        Exemplos:
            |headerParam    |valor |statusCode |mensagem                                                                                    |
            |Content-Type   |      |500        |Internal Server Error, please contact the support or try it again later.                    |
            |Content-Type   |null  |500        |Internal Server Error, please contact the support or try it again later.                    |
            |client_id_etsp |      |401        |Could not find a required APP in the request, identified by HEADER client_id                |
            |client_id_etsp |null  |401        |Could not find a required APP in the request, identified by HEADER client_id                |

    @Validacao_Campos_Obrigatorios
    Esquema do Cenário: Validação de campos obrigatórios

        Quando realizo uma requisição de Logon com o atributo "<atributo>" com o valor "<valor>"
        Então mensagem "<mensagem>" exibida no response body
        E código "<codigo>" exibido no response body
        E status code retornado é 412

        Exemplos:
            |atributo            |valor |mensagem                  |codigo  |
            |secret              |      |secret is required.       |412.31  |
            |secret              |null  |secret is required.       |412.31  |
     
    @Validacao_Campos_Invalidos
    Esquema do Cenário: Validação de campos com valores inválidos

        Quando realizo uma requisição de Logon com o atributo "<atributo>" com o valor "<valor>"
        Então mensagem "<mensagem>" exibida no response body
        E código "<codigo>" exibido no response body
        E status code retornado é 401

        Exemplos:
            |atributo            |valor      |mensagem                                                         |codigo  |
            |secret              |XPTO123    |Partner Secret does not match with provided partner information. |401.1   |

