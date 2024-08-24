module Muffon
  class Base < Service
    ERRORS = Muffon::Utils::Errors

    include Muffon::Utils::Base
    include Muffon::Utils::Request
    include Muffon::Utils::Profile
    include Muffon::Utils::ErrorHandlers
    include Muffon::Utils::Formatters
    include Muffon::Utils::More

    class << self
      def call(args = {})
        super
      rescue *ERRORS.list => e
        ERRORS.handle(e.class)
      end
    end

    def call
      return bad_request if not_all_args?
      return not_found if no_data?
      return forbidden if forbidden?

      data
    end

    private

    def call_again
      self.class.call(
        @args
      )
    end
  end
end
