module Muffon
  module Utils
    module Base
      private

      def credentials
        Rails
          .application
          .credentials
      end

      def current_time
        Time.now.utc
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
    end
  end
end
