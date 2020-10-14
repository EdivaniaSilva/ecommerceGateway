Metodos = MetodosComuns::MetodosComuns.new()

Então("status code retornado é {int}") do |statusCode|
    expect($statusCode).to eq(statusCode)
end

Então("código {string} exibido no response body") do |codeMessage|
    expect($response['code']).to eq(codeMessage)
end

Então("mensagem {string} exibida no response body") do |mensagem|
    Metodos.validaMensagemNoResponseBody(mensagem)
end
    
Então("parametro {string} exibido no response body") do |parametro|
    $response.include?parametro       
end

Então("parametro {string} não exibido no response body") do |parametro|
    $response.include?parametro       
end