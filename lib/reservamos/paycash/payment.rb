module Reservamos
    module Paycash
        class Payment

            attr_reader :emisor, :host, :token, :unica, :value, :vigencia, :monto
        
            def initialize(emisor, host, token, unica, value, vigencia, monto)
                @emisor = emisor
                @host = host
                @token = token
                @unica = unica
                @value = value
                @vigecia = vigencia
                @monto = monto
            end
        
            def request(url)
                request_hash = {
                    "Login" => {"Emisor" => @emisor, "Host" => @host, "Token" => @token},
                    "Unica" => @unica,
                    "Value" => @value,
                    "Vigencia" => @vigecia,
                    "Monto" => @monto
                    }
                @client = Savon.client(wsdl: url)
        
                @response = @client.call(:genera_referencia_corta) do
                    message request_hash
                end
            end
            
            def generate
                return @response.to_hash[:genera_referencia_corta_response][:genera_referencia_corta_result]
            end
        
        end
    end
end
  