module YandexMusic
  module Album
    class Tags < YandexMusic::Album::Info
      private

      def album_data
        { tags: tags }
      end
    end
  end
end
