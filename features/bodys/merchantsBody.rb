require 'cpf_faker'
require 'faker'

module Merchants

    class MetodosMerchants
        
        def dadosBodyMerchants()

            $hash_body = {
                "merchants" => [
                    {
                    "docNumber" => "62465331000154"
                    }
                ]   
            }

        end
    end
end 