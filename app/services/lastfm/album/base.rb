module LastFM
  module Album
    class Base < LastFM::Base
      API_METHOD = 'album.getInfo'.freeze

      include LastFM::Utils::Album

      def call
        check_args

        data
      rescue Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          artist_name
          album_title
        ]
      end

      def album
        response_data['album']
      end

      def params
        super.merge(
          album_params
        )
      end

      def data
        { album: album_data }
      end
    end
  end
end
