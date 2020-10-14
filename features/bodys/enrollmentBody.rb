require 'cpf_faker'
require 'faker'

module Enrollment

    class MetodosEnrollment
        
        def dadosBodyEnrollment()

            $card = "MIAGCSqGSIb3DQEHA6CAMIACAQAxggKJMIIChQIBADBtMF0xCzAJBgNVBAYTAkZSMRAwDgYDVQQKDAdHZW1hbHRvMRAwDgYDVQQLDAdUb3Vyc0RDMSowKAYDVQQDDCFDQlAgU3RhZ2luZyBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkCDGtwQNzEWL9iQ9fLYzANBgkqhkiG9w0BAQcwAASCAgAS16PKtxM2k90EPaoEj9HYpJzQWiw4qfLyHnNJwMG5VqXAyyXGah3bfAEfoI+lCoUsAiRxpJ4LngN9mFtwQPfXBn4QttrfOrrJZNMyScCKOyY0BZEt6P+Nrj9T5S8EFE09o/jrcNvYBuKLNgaNdU5QSphMxDwKCXIrPyQtBvqkJxFl9QWo0yuow4Lc2mKfI+1HC+M1SZMms5loXLkMmHPM43hFIhGCZY5wkfQH4syREz0z3PufShBvCAxqwjmSPWKJxSfwHtbaEZniQB9wN53GIKNeaJE8djOi8/RyjEmOXRpMAeIKR8iwtPT6X0l37WRKzVLW//tQK2xKupcrsjJWFnHSjw81M8FbXS8673IWw3gfRARLnMuE3rfoMH/5Dh9At2GclzDftGw+d+696IGNxmUEA8L4sJTJWxN6WIVEFHUnEeQeOKRCsuRQBvRR5bHutKW/bUInFGoJ6FTjDNjeZa4dNlXTcBwmZU1SCCwN+clZcXgnQieOMg+jNHiuHHRuENqAi9fpfpLJNVzOo2/AMOvLGTM12AcC2VylAnMNhNJ/U7YEwp7rimTWhhz1UGMg0TE1sg8jZsqLQ3+5wxhdSM/ebuB7gUElPcD5UrEaaZyTF800HCyEAsYhO5L8UQSI+8p/bz58sNQno4U4z+2LfCbtRlNht1sx0OK9jUAnnDCABgkqhkiG9w0BBwEwHQYJYIZIAWUDBAEqBBCnbmBkhsfjkXZiTY02plzVoIAEQNM1EB2oj896s8l7Z4EpHo3lD3XKyCW1L6ZdTWj2hKkb/lANxsksfOc8zBlxMTKdfIRwVXpWki7Lx07k0VxJ6V4AAAAAAAAAAAAA"

            $hash_body = {
                "card" => $card,
                "entryMode" => "MAN",
                "presentationType" => "ECM"
            }
        end
    end
end 