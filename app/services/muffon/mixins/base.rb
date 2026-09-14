module Muffon
  module Mixins
    module Base
      REQUEST_USER_AGENT =
        'Mozilla/5.0 (X11; Linux x86_64) ' \
        'AppleWebKit/537.36 (KHTML, like Gecko) ' \
        'Chrome/147.0.0.0 Safari/537.36'.freeze

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

      def replace_url_host(
        url:,
        new_host:
      )
        uri_data = URI.parse(url)

        old_host = "#{uri_data.scheme}://#{uri_data.host}"

        url.sub(
          old_host,
          new_host
        )
      end

      def get_response_cookie(
        raw_response:,
        cookie_name:
      )
        raw_response
          .headers['set-cookie']
          &.match(
            /#{cookie_name}=(\S+);/
          )
          .try(:[], 1)
      end

      def language
        @args[:language] || 'en'
      end

      def proxy_data
        credentials[:proxy]
      end

      def decrypt_string(
        value:,
        algorithm:,
        key:,
        initial_value:
      )
        cipher =
          OpenSSL::Cipher.new(
            algorithm
          )

        cipher.decrypt

        cipher.key = key
        cipher.iv = initial_value
        cipher.padding = 0

        cipher.update(value) << cipher.final
      end
    end
  end
end
