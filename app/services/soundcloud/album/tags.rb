module SoundCloud
  module Album
    class Tags < SoundCloud::Album::Base
      private

      def album_data
        {
          title: response_data['title'],
          artist: response_data.dig('user', 'username'),
          tags: tags
        }
      end
    end
  end
end
