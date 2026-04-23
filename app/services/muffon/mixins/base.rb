module Muffon
  module Mixins
    module Base
      private

      def credentials
        Rails
          .application
          .credentials
      end

      def current_time
        Time.current
      end

      def test?
        Rails.env.test?
      end

      def production?
        Rails.env.production?
      end

      def source_name
        self.class::SOURCE_NAME
      end

      def uuid_string
        SecureRandom.uuid
      end

      def parse_query_string(
        link:
      )
        raw_query =
          URI
          .parse(link)
          .query

        Rack::Utils.parse_nested_query(
          raw_query
        )
      end

      def self_args
        {
          profile_id: @args[:profile_id],
          token: @args[:token]
        }
      end

      def query_match_args
        {
          is_with_query_match: @args[:is_with_query_match],
          query_title: @args[:query_title],
          query_artist_name: @args[:query_artist_name]
        }
      end
    end
  end
end
