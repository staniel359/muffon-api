module YandexMusic
  module Track
    class Links < YandexMusic::Track::Info
      private

      def track_data
        Muffon::Formatter::Track::Links.call(
          source_original_link:,
          source_name:,
          source_track_id: yandexmusic_id
        )
      end
    end
  end
end
