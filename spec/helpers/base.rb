module Helpers
  module Base
    RANDOM_STRING = 'wejlhg239gh23'.freeze

    class << self
      def bad_request_error
        Muffon::Utils::Errors.handlers[:bad_request]
      end

      def not_found_error
        Muffon::Utils::Errors.handlers[:not_found]
      end
    end
  end
end
