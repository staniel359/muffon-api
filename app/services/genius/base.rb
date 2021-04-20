module Genius
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      data
    end

    private

    def no_data?
      false
    end
  end
end
