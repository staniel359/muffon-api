module LastFM
  class Base < Muffon::Base
    def call
      return bad_request_error if primary_args.any?(&:blank?)
      return not_found_error if no_data?

      data
    end
  end
end
