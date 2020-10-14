RegisterAPI = Register::RegisterAPI.new()
MetodosRegister = Register::MetodosRegister.new()

#Step usado como contexto para testes de outras chamadas
Dado("que realizo uma requisição de Register") do
    Metodos.dadosHeader()
    MetodosRegister.dadosBodyRegister()
    RegisterAPI.register()

    #Verifica se a pré-chamada foi executada com sucesso
    expect($response.code).to eq(201)

    #Variaveis que serão utilizadas nas próximas chamadas
    $partnerId = $response["id"]
    $partnerSecret = $response["secret"]
    $etspClientId = $response.headers["client_id"]

end


#Steps usados nos testes da chamada de Register
Quando("realizo uma requisição de Register") do
    Metodos.dadosHeader()
    MetodosRegister.dadosBodyRegister()
    RegisterAPI.register()
end

Quando("realizo uma requisição de Register com o atributo {string} com o valor {string}") do |atributo, valor|
    Metodos.dadosHeader()
    MetodosRegister.dadosBodyRegister()
    Metodos.atribuiValorAoHashBody(atributo, valor)
    RegisterAPI.register()
end

Quando("realizo uma requisição de Register com o header param {string} com o valor {string}") do |atributo, valor|
    Metodos.dadosHeader()
    Metodos.atribuiValorAoHashHeader(atributo, valor)

    RegisterAPI.register()   
end


