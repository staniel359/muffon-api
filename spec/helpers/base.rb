module Helpers
  module Base
    RANDOM_STRING = 'wejlhg239gh23'.freeze

    class << self
      def bad_request_error
        { error: { code: 400, text: 'Bad request' } }
      end

      def not_found_error
        { error: { code: 404, text: 'Not found' } }
      end
    end
  end
end
