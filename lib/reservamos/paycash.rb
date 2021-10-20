# frozen_string_literal: true
require_relative "paycash/version"

module Reservamos
  module Paycash
    class Error < StandardError; end
    # Your code goes here...

    def self.set_client_request(emisor:, host:, token:, unica:, value:, vigencia:, monto:)
      @client = Reservamos::Paycash::Payment.new(
        emisor,
        host,
        token,
        unica,
        value,
        vigencia,
        monto
      )
        
    end

    def self.set_client
      @client.request("https://sb-paycash.redefectiva.net/WSPayCashLibrary/service.asmx?wsdl")
    end
    
    def self.generar_referencia
      return @client.generate
    end

  end
end
