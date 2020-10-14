#language:pt
@POST_Requestors
Funcionalidade: POST /requestors - Onbording

    Contexto: Register

        Dado que realizo uma requisição de Register

    #SUCESS FLOW
    @Sucess_Flow
    Cenario: Onbording cadastrado com sucesso

        Quando realizo uma requisição de Onbording
        Então status code retornado é 201
        E parametro "id" exibido no response body
        E parametro "networkCode" exibido no response body
        E parametro "secret" exibido no response body
        
     #ALTERNATIVE FLOW

    @Validacao_Header
    Esquema do Cenário: Validação de Header Params obrigatórios

        Quando realizo uma requisição de Onbording com o header param "<headerParam>" com o valor "<valor>"
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

        Quando realizo uma requisição de Onbording com o atributo "<atributo>" com o valor "<valor>"
        Então mensagem "<mensagem>" exibida no response body
        E código "<codigo>" exibido no response body
        E status code retornado é 412

        Exemplos:
            |atributo                   |valor |mensagem                                                        |codigo  |
            |partner.number             |      |Partner number is required                                      |412.7   |
            |partner.number             |null  |Partner number is required                                      |412.7   |
            |partner.secret             |      |Partner contains an invalid secret.                             |412.8   |   
            |partner.secret             |null  |Partner contains an invalid secret.                             |412.8   |
            |partner.networkCode        |      |networkCode is required.                                        |412.31  |
            |partner.networkCode        |null  |networkCode is required.                                        |412.31  |
            |name                       |      |Name is required.                                               |412.9   |
            |name                       |null  |Name is required.                                               |412.9   |
            |domain                     |      |Domain is required. It must be GTW, MER, MWL, OWL or AGG.       |412.10  |
            |domain                     |null  |Domain is required. It must be GTW, MER, MWL, OWL or AGG.       |412.10  |
            |bins.0.end                 |      |End is required                                                 |412.13  |
            |bins.0.end                 |null  |End is required                                                 |412.13  |
            |bins.0.start               |      |Start is required                                               |412.12  |
            |bins.0.start               |null  |Start is required                                               |412.12  |
            |bins.0.country             |      |Country is required                                             |412.14  |
            |bins.0.country             |null  |Country is required                                             |412.14  |
           

    @Validacao_Campos_Invalidos
    Esquema do Cenário: Validação de campos com valores inválidos

       Quando realizo uma requisição de Onbording com o atributo "<atributo>" com o valor "XPTO123"
        Então mensagem "<mensagem>" exibida no response body
        E código "<codigo>" exibido no response body
        E status code retornado é <statusCode>

        Exemplos:
            |atributo                                   |statusCode |mensagem                                                        |codigo  |
            |partner.secret                             |401        |Partner Secret does not match with provided partner information.|401.1   |
            |domain                                     |412        |Domain is required. It must be GTW, MER, MWL, OWL or AGG.       |412.10  |
         #  |restrictions.provisioning.presentationType |412        |PresentationType is invalid.                                    |412.11  |
            |bins.0.end                                 |422        |You need to provide a valid bin.                                |422.10  |
            |bins.0.start                               |422        |You need to provide a valid bin.                                |422.10  |
            |bins.0.country                             |422        |You need to provide a valid bin.                                |422.10  |
         #  |bins.0.enrollment.params.0                 |412        |Params is invalid.                                              |412.15  |