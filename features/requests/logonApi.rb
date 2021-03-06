require 'cpf_faker'
require 'httparty'
require 'pry'
require 'json'

module Logon

    class LogonAPI

        def logon()

            begin

                url = $urlBase + "/requestors/" + $requestorId + "/logon"
                
                $response = HTTParty.post(url,
                                    headers: header,
                                    body: body
                                    )

                $statusCode = $response.code

            end
        end
 

        def header
            {
                'Content-Type': $hash_header["Content-Type"],
                'client_id': $hash_header["client_id_etsp"]
            }
        end

        def body
                $hash_body.to_json          
        end

    end

end   



