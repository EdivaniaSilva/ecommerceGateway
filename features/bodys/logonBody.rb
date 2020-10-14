require 'cpf_faker'
require 'faker'

module Logon

    class MetodosLogon
        
        def dadosBodyLogon()

            $hash_body = {
                "secret" => $partnerSecret
            }
        end
    end
end