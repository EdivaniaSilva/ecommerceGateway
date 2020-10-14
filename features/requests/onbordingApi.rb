require 'cpf_faker'
require 'httparty'
require 'pry'
require 'json'

module Onbording

    class OnbordingAPI

        def onbording()

            begin

                url = $urlBase + "/requestors"

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



