module LastFM
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      data
    rescue *Muffon::Errors.list => e
      Muffon::Errors.handle(e.class)
    end
  end
end
