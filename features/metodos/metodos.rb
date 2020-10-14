require 'rspec'
include RSpec::Matchers
require 'hashie'
include Hashie::Extensions::DeepMerge
include Hashie::Extensions::DeepFind

module MetodosComuns

    class MetodosComuns

        def dadosHeader() 

            $hash_header = {
                "Content-Type" => "application/json",
                "client_id_backoffice" => "a0a95894-b974-3e8d-9d2f-4abc9b3d8730",
                "access_token_backoffice" => "8e41fcf7-4837-3375-bd74-5edfa60cf4a9",
                "client_id_etsp" => $etspClientId,
                "access_token_etsp" => $accessToken
            }
        end



        def atribuiValorAoHashBody(atributo, valor)

            if valor == "null"
                valor = valor.gsub!(/\A"|"\Z/, '')
            end
            

            #Verifica se o atributo não possui ponto, que separa um array e um atributo do body
            if atributo.include?(".") == false

                hash_body_novo = {
                    atributo => valor
                }
            
                $hash_body = $hash_body.deep_merge(hash_body_novo)

            end

            #Verifica se no atributo tem um ponto, que indica que é um array e um atributo
            if atributo.include?(".") == true

                # Verifica se tem um ".0" no nome do atributo, o que indica que é um array e necessita de chaves '[]'.
                if atributo.include?(".0") == true
                    isArray = true
                end

                if atributo.include?(".0") == false
                    isArray = false
                end

                atributo = atributo.tr('0', '')

                numeroDePontos = atributo.count "."
            
                if (numeroDePontos == 1) || (numeroDePontos == 2 && isArray == true)

                    #Faz a separação dos atributos 
                    #   Exemplo: certificates.usage
                    #   primeiroAtributo = certificates 
                    #   segundoAtributo = usage
                    atributo = atributo.scan(/\w+/)
                    primeiroAtributo = atributo[0]
                    segundoAtributo = atributo[1]

                   
                    hash_body_novo = {
                        segundoAtributo => valor
                    }
                
                    #Verifica se o atributo é um array, e necessita de chaves '[]' no body.
                    if isArray == true

                        meu_hash = $hash_body[primeiroAtributo][0]

                        if meu_hash == nil
                            meu_hash = $hash_body[primeiroAtributo]
                        end

                        hash_body_sub = meu_hash.deep_merge(hash_body_novo)

                        hash_final = {
                            primeiroAtributo => [hash_body_sub]
                        }
                    end
    
                    #Verifica se o atributo não é um array, e não necessita de chaves '[]' no body.
                    if isArray == false

                        meu_hash = $hash_body[primeiroAtributo]

                        if meu_hash == nil
                            meu_hash = $hash_body[primeiroAtributo]
                        end

                        hash_body_sub = meu_hash.deep_merge(hash_body_novo)

                        hash_final = {
                            primeiroAtributo => hash_body_sub
                        }
                    end

                    $hash_body = $hash_body.deep_merge(hash_final)

                end

              
                if numeroDePontos == 2 && isArray == false

                    #Faz a separação dos atributos 
                    #   Exemplo: certificates.usage
                    #   primeiroAtributo = certificates 
                    #   segundoAtributo = usage
                    atributo = atributo.scan(/\w+/)
                    primeiroAtributo = atributo[0]
                    segundoAtributo = atributo[1]
                    terceiroAtributo = atributo[2]


                    #Verifica se o valor é diferente de nulo, porque se não for, não precisa remover as aspas("").
                    if valor != "null"
                        hash_body_novo = {
                            terceiroAtributo => valor
                        }
                    end
                
                    #Verifica se o valor é nulo, porque se for, precisa remover as aspas("").
                    if valor == "null"
                        #A chave e valor novos são armazenada dentro do hash_body_novo
                        hash_body_novo = {
                            terceiroAtributo => valor.gsub!(/\A"|"\Z/, '')
                        }
                    end
                                    
                    meu_hash = $hash_body[primeiroAtributo][0]

                    #Faz merge entre os dados do primeiroAtributo, o que tinha antes e o valor novo.
                    hash_body_sub = meu_hash.deep_merge(hash_body_novo)

                    if meu_hash == nil
                        meu_hash = $hash_body[primeiroAtributo][segundoAtributo]
                    end


                    hash_final = {
                        primeiroAtributo => [hash_body_sub]
                    }

                    $hash_body = $hash_body.deep_merge(hash_final)

                end           

            end       

        end


        def atribuiValorAoHashHeader(atributo, valor)

  
            if valor == "null"
                valor = valor.gsub!(/\A"|"\Z/, '')
            end

            hash_header_novo = {
                atributo => valor
            }
            
            $hash_header.merge!(hash_header_novo)

        end

        def validaMensagemNoResponseBody(mensagem)
            descriptionPresente = $response.include?'description'
    
            if descriptionPresente == true
                expect($response['description']).to eq(mensagem)
            end
            
            if descriptionPresente == false
                $response = $response.parsed_response
                expect($response).to eq(mensagem)
            end
        end
    
    end

end