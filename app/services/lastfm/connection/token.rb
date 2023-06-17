module LastFM
  module Connection
    class Token < LastFM::Base
      API_METHOD = 'auth.getToken'.freeze
      LASTFM_LANGUAGES = %w[
        de es fr it ja pl pt ru sv tr zh
      ].freeze

      private

      def data
        {
          token:,
          link: connect_link
        }
      end

      def token
        response_data['token']
      end

      def connect_link
        "#{connect_base_link}" \
          "?api_key=#{api_key}&token=#{token}"
      end

      def connect_base_link
        [
          'https://www.last.fm',
          language,
          'api/auth'
        ].compact.join(
          '/'
        )
      end

      def language
        @args[:language] if language_present?
      end

      def language_present?
        @args[:language].in?(
          LASTFM_LANGUAGES
        )
      end
    end
  end
end
