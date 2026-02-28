module Faraday
  module FlatParamsEncoder
    def self.escape(arg)
      if arg.is_a?(String) && arg.include?('=')
        arg
      else
        Faraday::Utils.escape(arg)
      end
    end
  end
end
