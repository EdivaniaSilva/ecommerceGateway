MerchantsAPI = Merchants::MerchantsAPI.new()
MetodosMerchants = Merchants::MetodosMerchants.new()

#Step usado como contexto para testes de outras chamadas
Dado("que realizo uma requisição de Merchants") do
    Metodos.dadosHeader()
    MetodosMerchants.dadosBodyMerchants()
    MerchantsAPI.merchants()
    
    #Variaveis que serão utilizadas nas próximas chamadas


    #Verifica se a pré-chamada foi executada com sucesso
    expect($response.code).to eq(200)

end


#Steps usados nos testes da chamada de Merchants
Quando("realizo uma requisição de Merchants") do
    Metodos.dadosHeader()
    MetodosMerchants.dadosBodyMerchants()
    MerchantsAPI.merchants()

end

Quando("realizo uma requisição de Merchants com o atributo {string} com o valor {string}") do |atributo, valor|
    Metodos.dadosHeader()
    MetodosMerchants.dadosBodyMerchants()
    Metodos.atribuiValorAoHashBody(atributo, valor)
    MerchantsAPI.merchants()
end

Quando("realizo uma requisição de Merchants com o header param {string} com o valor {string}") do |atributo, valor|
    Metodos.dadosHeader()
    MetodosMerchants.dadosBodyMerchants()
    Metodos.atribuiValorAoHashHeader(atributo, valor)
    MerchantsAPI.merchants()
end


