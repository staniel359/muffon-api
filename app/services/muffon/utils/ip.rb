module Muffon
  module Utils
    class IP < Muffon::Base
      def call
        RestClient.get('http://api.ipify.org/').body
      end
    end
  end
end
