module Bandcamp
  module Album
    class Base < Bandcamp::Base
      include Bandcamp::Utils::Album

      private

      def primary_args
        [
          @args[:artist_id],
          @args[:album_id]
        ]
      end

      def params
        {
          band_id: @args[:artist_id],
          tralbum_id: @args[:album_id],
          tralbum_type: bandcamp_album_type
        }
      end

      def bandcamp_album_type
        @args[:album_type].try(
          :[], 0
        ) || 'a'
      end

      def data
        { album: album_data }
      end

      alias link album_track_link
    end
  end
end
