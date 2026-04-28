module YandexMusic
  module Album
    class Tags < YandexMusic::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Tags.call(
          tags:
        )
      end
    end
  end
end
