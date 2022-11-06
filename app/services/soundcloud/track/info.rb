module SoundCloud
  module Track
    class Info < SoundCloud::Track::Base
      private

      def track_data
        self_data
          .merge(track_base_data)
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          source: source_data,
          player_id:,
          title:,
          artist: artist_names_data,
          artists:
        }
      end

      def track_extra_data
        {
          image: image_data,
          profiles_count:,
          duration:,
          duration_seconds:,
          description:
            description_truncated,
          tags: tags_truncated,
          audio: audio_data
        }.compact
      end

      def description
        track['description']
      end

      def tags_list
        [
          track['genre'].presence
        ].compact
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link
        }
      end

      def audio_link
        return unless audio_present?

        @audio_link ||=
          SoundCloud::Utils::Audio::Link.call(
            track_id: @args[:track_id]
          )
      end
    end
  end
end
