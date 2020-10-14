LogonAPI = Logon::LogonAPI.new()
MetodosLogon = Logon::MetodosLogon.new()

#Step usado como contexto para testes de outras chamadas
Dado("que realizo uma requisição de Logon") do
    Metodos.dadosHeader()
    MetodosLogon.dadosBodyLogon()
    LogonAPI.logon()

    #Verifica se a pré-chamada foi executada com sucesso
    expect($response.code).to eq(201)
    
    #Variaveis que serão utilizadas nas próximas chamadas
    $accessToken = $response["accessToken"]


end


#Steps usados nos testes da chamada de Logon
Quando("realizo uma requisição de Logon") do
    Metodos.dadosHeader()
    MetodosLogon.dadosBodyLogon()
    LogonAPI.logon()
end

Quando("realizo uma requisição de Logon com o atributo {string} com o valor {string}") do |atributo, valor|
    Metodos.dadosHeader()
    MetodosLogon.dadosBodyLogon()
    Metodos.atribuiValorAoHashBody(atributo, valor)
    LogonAPI.logon()
end

Quando("realizo uma requisição de Logon com o header param {string} com o valor {string}") do |atributo, valor|
    Metodos.dadosHeader()
    MetodosLogon.dadosBodyLogon()
    Metodos.atribuiValorAoHashHeader(atributo, valor)
    LogonAPI.logon()
end


