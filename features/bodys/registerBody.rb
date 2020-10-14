require 'cpf_faker'
require 'faker'

module Register

    class MetodosRegister
        
        def dadosBodyRegister()

            $hash_body = {
                "logonType" => "SECRET",
                "name" => "Test-56789432"+Faker::Number.leading_zero_number(digits: 10)+Faker::Number.leading_zero_number(digits: 10),
                "onboarding" => "EXTERNAL",
                "sessionValidSeconds" => 36000,
                "status" => "INACTIVE",
                "provisioningLukType" => "INTERNAL",
                "tokenRequestorConfiguration" => true,
                "callbackUrl" => "http://api-gateway-sensedia-api-platform-gateway.apitec-d.americas.net/qa/notification/s4",
                "maxRequestors" => 20,
                "networkCode" => "6748",
                "clearanceMode" => "INCOMING",
                "certificates" => [
                    {
                        "alias" => "aliasCA",
                        "content" => "contentCA",
                        "expiration" => "2099-12-01",
                        "usage" => "CA"
                    }
                ]   
            }      
        end
    end
end