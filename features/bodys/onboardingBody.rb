require 'cpf_faker'
require 'faker'

module Onbording

    class MetodosOnbording
        
        def dadosBodyOnbording()

            $hash_body =  {
                "partner" => {
                    "number" => $partnerId,
                    "secret" => $partnerSecret,
                    "networkCode" => "6748",
                    "clearanceMode" => "INCOMING"
                },
                "name" => Faker::Company.name,
                "domain" => "GTW",
                "restrictions" => {
                    "provisioning" => {
                        "maximumCredentials" => 1,
                        "maximumTokens" => 1,
                        "presentationType" => [
                            "ECM",
                            "NFC",
                            "MST"
                        ]
                    },
                    "usage" => {
                        "credentialsCount" => 0,
                        "tokenCount" => 99
                    }
                },
                "bins" => [
                    {
                        "end" => "60334289",
                        "start" => "60334200",
                        "country" => "BR",
                        "enrollment" => {
                            "params" => [
                                "PAN_16"
                            ]
                        },
                        "tsps" => [
                            {
                                "id" => "2e936958-9fbf-11e4-89d3-123b93f75cba",
                                "priority" => 1
                            }
                        ]
                    }
                ],
                "certificates" => [
                    {
                        "usage" => "ENC",
                        "alias" => "LOCAL_PKCS7",
                        "content" => "CN=TSP-MG-WS.LAB.EDENRED,OU=Banking & Payment,O=EDENRED,C=BR,ST=Sao Paulo,L=Sao Paulo"
                    },
                    {
                        "usage" => "DEC",
                        "alias" => "LOCAL_PKCS7",
                        "content" => "CN=TSP-MG-WS.LAB.EDENRED,OU=Banking & Payment,O=EDENRED,C=BR,ST=Sao Paulo,L=Sao Paulo"
                    },
                ]
            }
            
        end
    end
end