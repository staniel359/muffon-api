module YandexMusic
  module Album
    class Links < YandexMusic::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Links.call(
          source_original_link:,
          source_name:,
          source_album_id: yandexmusic_id
        )
      end
    end
  end
end
