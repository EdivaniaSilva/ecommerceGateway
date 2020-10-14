OnbordingAPI = Onbording::OnbordingAPI.new()
MetodosOnbording = Onbording::MetodosOnbording.new()

#Step usado como contexto para testes de outras chamadas
Dado("que realizo uma requisição de Onbording") do
    Metodos.dadosHeader()
    MetodosOnbording.dadosBodyOnbording()
    OnbordingAPI.onbording()
    
    #Variaveis que serão utilizadas nas próximas chamadas
    $requestorId = $response["id"]

    #Verifica se a pré-chamada foi executada com sucesso
    expect($response.code).to eq(201)
end


#Steps usados nos testes da chamada de Onbording
Quando("realizo uma requisição de Onbording") do
    Metodos.dadosHeader()
    MetodosOnbording.dadosBodyOnbording()

    OnbordingAPI.onbording()
end

Quando("realizo uma requisição de Onbording com o atributo {string} com o valor {string}") do |atributo, valor|
    Metodos.dadosHeader()
    MetodosOnbording.dadosBodyOnbording()
    Metodos.atribuiValorAoHashBody(atributo, valor)
    OnbordingAPI.onbording()
end

Quando("realizo uma requisição de Onbording com o header param {string} com o valor {string}") do |atributo, valor|
    Metodos.dadosHeader()
    Metodos.atribuiValorAoHashHeader(atributo, valor)    
    OnbordingAPI.onbording()
end


