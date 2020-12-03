module Muffon
  class Errors < Muffon::Base
    def call
      OpenStruct.new(errors_hash)
    end

    private

    def errors_hash
      errors_array.map do |a|
        key, code, text = a

        { key => { error: { code: code, text: text } } }
      end.inject(:merge)
    end

    def errors_array
      [
        ['bad_request', 400, 'Bad request'],
        ['not_found', 404, 'Not found'],
        ['bad_gateway', 502, 'Bad Gateway'],
        ['gateway_timeout', 504, 'Gateway Timeout']
      ]
    end
  end
end
