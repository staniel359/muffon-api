module YandexMusic
  module Track
    class Info < YandexMusic::Track::Base
      private

      def track_data
        self_data
          .merge(track_base_data)
          .merge(track_extra_data)
      end

      def track_base_data
        {
          source: source_data,
          player_id:,
          title:,
          extra_title:,
          artist: artist_names_data,
          artists:
        }.compact
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          profiles_count:,
          duration:,
          duration_seconds:,
          audio: audio_data
        }.compact
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link
        }
      end

      def audio_link
        @audio_link ||=
          YandexMusic::Utils::Audio::Link.call(
            track_id: @args[:track_id]
          )
      end
    end
  end
end
