#language:pt
@POST_enrollments
Funcionalidade: POST /enrollments - Enrollments

    Contexto: Enrollment

        Dado que realizo uma requisição de Register
        E que realizo uma requisição de Onbording
        E que realizo uma requisição de Logon

    #SUCESS FLOW
    
    @Sucess_Flow
    Cenario: Enrollment realizado com sucesso
        Quando realizo uma requisição de Enrollment
        Então status code retornado é 201
        E parametro "accessToken" exibido no response body

        
    #ALTERNATIVE FLOW

    @Validacao_Header
    Esquema do Cenário: Validação de Header Params obrigatórios

        Quando realizo uma requisição de Enrollment com o header param "<headerParam>" com o valor "<valor>"
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

        Quando realizo uma requisição de Enrollment com o atributo "<atributo>" com o valor "<valor>"
        Então mensagem "<mensagem>" exibida no response body
        E código "<codigo>" exibido no response body
        E status code retornado é 412

        Exemplos:
            |atributo               |valor |mensagem                        |codigo |
            |card                   |      |Card is required                |412.4  |
            |card                   |null  |Card is required                |412.4  |
            |entryMode              |      |Entry mode is required          |412.5  |
            |entryMode              |null  |Entry mode is required          |412.5  |
            |presentationType       |      |Presentation type is required   |412.6  |
            |presentationType       |null  |Presentation type is required   |412.6  |
     
    @Validacao_Campos_Invalidos
    Esquema do Cenário: Validação de campos com valores inválidos

        Quando realizo uma requisição de Enrollment com o atributo "<atributo>" com o valor "<valor>"
        Então mensagem "<mensagem>" exibida no response body
        E código "<codigo>" exibido no response body
        E status code retornado é <statusCode>

        Exemplos:
            |atributo          |valor      |statusCode |mensagem                                                   |codigo  |
            |card              |XPTO123    |422        |Error to encrypt or decrypt payload                        |422.84  |
            |entryMode         |XPTO123    |422        |CardEntry  is required, it must be MAN, OCR, APP or FILE   |422.80  |
            |presentationType  |XPTO123    |422        |Presentation Type is invalid                               |422.54  |




