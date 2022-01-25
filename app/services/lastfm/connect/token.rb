module LastFM
  module Connect
    class Token < LastFM::Base
      API_METHOD = 'auth.getToken'.freeze

      private

      def data
        { connect: connect_data }
      end

      def connect_data
        {
          token:,
          link: connect_link
        }
      end

      def token
        @token ||= response_data['token']
      end

      def connect_link
        'https://www.last.fm/api/auth'\
          "?api_key=#{api_key}&token=#{token}"
      end
    end
  end
end
