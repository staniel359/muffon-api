module Muffon
  module Utils
    module ErrorHandlers
      ERRORS = Muffon::Utils::Errors

      private

      def not_found
        ERRORS.handlers[:not_found]
      end

      def bad_request
        ERRORS.handlers[:bad_request]
      end

      def forbidden
        ERRORS.handlers[:forbidden]
      end
    end
  end
end
