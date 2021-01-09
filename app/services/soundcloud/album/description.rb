module SoundCloud
  module Album
    class Description < SoundCloud::Album::Base
      private

      def album_data
        {
          title: response_data['title'],
          artist: response_data.dig('user', 'username'),
          description: description
        }
      end
    end
  end
end
