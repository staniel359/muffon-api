module YandexMusic
  module Album
    class Links < YandexMusic::Album::Info
      private

      def album_data
        { links: source_links_data }
      end
    end
  end
end
