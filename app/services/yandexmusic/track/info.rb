module YandexMusic
  module Track
    class Info < YandexMusic::Track::Base
      private

      def track_data
        track_base_data
          .merge(track_extra_data)
      end

      def track_base_data
        {
          title: title,
          extra_title: extra_title,
          yandex_music_id: yandex_music_id,
          artist: artist_formatted,
          artists: artists
        }.compact
      end

      def track_extra_data
        {
          album: album_formatted,
          albums: albums,
          image: image_data,
          duration: duration,
          audio: audio_data
        }
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link,
          source_id: SOURCE_ID
        }
      end

      def audio_link
        @audio_link ||= YandexMusic::Utils::Audio::Link.call(
          track_id: yandex_music_id
        )
      end
    end
  end
end
