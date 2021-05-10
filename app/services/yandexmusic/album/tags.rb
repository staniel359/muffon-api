module YandexMusic
  module Album
    class Tags < YandexMusic::Album::Base
      private

      def album_data
        {
          title: title,
          artist: artist_data,
          tags: tags
        }
      end
    end
  end
end
