module SoundCloud
  module Album
    class Tags < SoundCloud::Album::Base
      private

      def album_data
        {
          title: title,
          artist: artist_data(response_data),
          tags: tags
        }
      end
    end
  end
end
