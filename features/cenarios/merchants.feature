#language:pt
@POST_merchants
Funcionalidade: POST /merchants - Merchants

    Contexto: Register, Onbording e Logon

        Dado que realizo uma requisição de Register
        Dado que realizo uma requisição de Onbording
        E que realizo uma requisição de Logon

    #SUCESS FLOW
    
    @Sucess_Flow
    Cenario: Merchants realizado com sucesso
    
        Quando realizo uma requisição de Merchants
        Então status code retornado é 200
        E parametro "merchants" exibido no response body
        E parametro "requestorInfo" exibido no response body

        
    #ALTERNATIVE FLOW

    @Validacao_Header
    Esquema do Cenário: Validação de Header Params obrigatórios

        Quando realizo uma requisição de Merchants com o header param "<headerParam>" com o valor "<valor>"
        Então mensagem "<mensagem>" exibida no response body
        Então status code retornado é <statusCode>
        

        Exemplos:
            |headerParam       |valor |statusCode |mensagem                                                                                    |
            |Content-Type      |      |500        |Internal Server Error, please contact the support or try it again later.                    |
            |Content-Type      |null  |500        |Internal Server Error, please contact the support or try it again later.                    |
            |client_id_etsp    |      |401        |Could not find a required APP in the request, identified by HEADER client_id                |
            |client_id_etsp    |null  |401        |Could not find a required APP in the request, identified by HEADER client_id                |
            |access_token_etsp |      |401        |Could not find a required Access Token in the request, identified by HEADER access_token    |
            |access_token_etsp |null  |401        |Could not find a required Access Token in the request, identified by HEADER access_token    |


    
    @Validacao_Campos_Obrigatorios
    Esquema do Cenário: Validação de campos obrigatórios

        Quando realizo uma requisição de Merchants com o atributo "<atributo>" com o valor "<valor>"
        Então mensagem "<mensagem>" exibida no response body
        E código "<codigo>" exibido no response body
        E status code retornado é 412

        Exemplos:
            |atributo               |valor |mensagem                                |codigo |
            |merchants.0.docNumber  |      |Merchant document number is invalid.    |412.17 |
            |merchants.0.docNumber  |null  |Merchant document number is invalid.    |412.17 |
         
     
    @Validacao_Campos_Invalidos
    Esquema do Cenário: Validação de campos com valores inválidos

        Quando realizo uma requisição de Merchants com o atributo "<atributo>" com o valor "<valor>"
        Então status code retornado é 200
        E parametro "merchants" exibido no response body
       # E parametro "merchants.id" não exibido no response body
        E parametro "requestorInfo" exibido no response body

        Exemplos:
            |atributo          |valor      |
            |docNumber         |XPTO123    |