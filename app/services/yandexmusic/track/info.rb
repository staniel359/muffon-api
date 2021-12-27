module YandexMusic
  module Track
    class Info < YandexMusic::Track::Base
      private

      def track_data
        muffon_data
          .merge(track_base_data)
          .merge(track_extra_data)
      end

      def track_base_data
        {
          player_id: player_id,
          source_id: SOURCE_ID,
          yandex_music_id: yandex_music_id,
          title: title,
          extra_title: extra_title,
          artists: artists
        }.compact
      end

      def track_extra_data
        {
          album: albums&.first,
          image: image_data,
          duration: duration,
          duration_seconds: duration_seconds,
          audio: audio_data
        }.compact
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link,
          source_id: SOURCE_ID
        }
      end

      def audio_link
        @audio_link ||=
          YandexMusic::Utils::Audio::Link.call(
            track_id: yandex_music_id
          )
      end
    end
  end
end
