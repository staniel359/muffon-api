module Muffon
  class Base
    ERRORS = Muffon::Utils::Errors
    include Muffon::Utils::ErrorHandlers
    include Muffon::Utils::Formatters
    include Muffon::Utils::More

    class << self
      def call(args = {})
        new(args).call
      rescue *ERRORS.list => e
        ERRORS.handle(e.class)
      end
    end

    def initialize(args = {})
      @args = args
    end

    def call
      return bad_request if not_all_args?
      return not_found if no_data?

      data
    end

    private

    def not_all_args?
      primary_args.any?(&:blank?)
    end

    def primary_args
      []
    end

    def no_data?
      false
    end

    def response_data
      @response_data ||=
        JSON.parse(
          response
        )
    end

    def response
      RestClient.get(
        link, headers
      )
    end

    def post_response
      RestClient.post(
        link, payload, headers
      )
    end

    def headers
      {
        params:,
        cookies:
      }
    end

    def params
      {}
    end

    def cookies
      {}
    end

    def secrets
      Rails.application.credentials
    end

    def language
      @args[:language] || 'en'
    end

    def muffon_data
      {
        library_id:,
        listened_id:,
        bookmark_id:,
        favorite_id:
      }.compact
    end

    def profile
      @profile ||=
        ::Profile.find_by(
          id: @args[:profile_id]
        )
    end

    def other_profile
      @other_profile ||=
        ::Profile.find_by(
          id: @args[:other_profile_id]
        )
    end

    def source_name
      self.class::SOURCE_NAME
    end

    def user_agent
      'Mozilla/5.0 (X11; Linux x86_64) ' \
        'AppleWebKit/537.36 (KHTML, like Gecko) ' \
        'Chrome/101.0.4951.41 Safari/537.36'
    end

    def current_time
      Time.now.utc
    end
  end
end
