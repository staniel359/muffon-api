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
          source_id:,
          player_id:,
          yandex_music_id:,
          title:,
          extra_title:,
          artist: artist_names_data,
          artists:
        }.compact
      end

      def track_extra_data
        {
          album: albums&.first,
          image: image_data,
          duration:,
          duration_seconds:,
          audio: audio_data
        }.compact
      end

      def audio_data
        {
          source_id:,
          present: audio_link.present?,
          link: audio_link
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
