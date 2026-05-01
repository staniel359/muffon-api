module LastFM
  module Connection
    class Token < LastFM::Base
      API_METHOD = 'auth.getToken'.freeze
      LASTFM_LANGUAGES = %w[
        de es fr it ja pl pt ru sv tr zh
      ].freeze

      def call
        data
      end

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
          (language if language_available?),
          'api/auth'
        ]
          .compact
          .join('/')
      end

      def language_available?
        LASTFM_LANGUAGES.include?(
          @args[:language]
        )
      end
    end
  end
end
