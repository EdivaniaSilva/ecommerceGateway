EnrollmentAPI = Enrollment::EnrollmentAPI.new()
MetodosEnrollment = Enrollment::MetodosEnrollment.new()

#Step usado como contexto para testes de outras chamadas
Dado("que realizo uma requisição de Enrollment") do
    Metodos.dadosHeader()
    MetodosEnrollment.dadosBodyEnrollment()
    EnrollmentAPI.enrollment()
    
    #Variaveis que serão utilizadas nas próximas chamadas


    #Verifica se a pré-chamada foi executada com sucesso
    expect($response.code).to eq(201)

end


#Steps usados nos testes da chamada de Enrollment
Quando("realizo uma requisição de Enrollment") do
    Metodos.dadosHeader()

    MetodosEnrollment.dadosBodyEnrollment()
    EnrollmentAPI.enrollment()

end

Quando("realizo uma requisição de Enrollment com o atributo {string} com o valor {string}") do |atributo, valor|
    Metodos.dadosHeader()
    MetodosEnrollment.dadosBodyEnrollment()
    Metodos.atribuiValorAoHashBody(atributo, valor)
    EnrollmentAPI.enrollment()
end

Quando("realizo uma requisição de Enrollment com o header param {string} com o valor {string}") do |atributo, valor|
    Metodos.dadosHeader()
    MetodosEnrollment.dadosBodyEnrollment()
    Metodos.atribuiValorAoHashHeader(atributo, valor)
    EnrollmentAPI.enrollment()
end


