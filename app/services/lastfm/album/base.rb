module LastFM
  module Album
    class Base < LastFM::Base
      API_METHOD = 'album.getInfo'.freeze

      include LastFM::Utils::Album

      private

      def primary_args
        [
          @args[:artist_name],
          @args[:album_title]
        ]
      end

      def no_data?
        album.blank?
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
