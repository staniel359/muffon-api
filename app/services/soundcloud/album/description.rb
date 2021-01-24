module SoundCloud
  module Album
    class Description < SoundCloud::Album::Base
      private

      def album_data
        {
          title: response_data['title'],
          artist: artist_data(response_data),
          description: description
        }
      end
    end
  end
end
