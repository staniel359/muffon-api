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
          player_id: player_source_id,
          title:,
          artist: artists_base_data,
          artists:
        }
      end

      def track_extra_data
        {
          image: image_data,
          profiles_count:,
          duration:,
          description:
            description_truncated,
          tags: tags_truncated,
          audio: audio_base_data
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

      def audio_link
        SoundCloud::Utils::Audio::AlternativeLink.call(
          track_id: @args[:track_id],
          link: original_link
        )
      end
    end
  end
end
