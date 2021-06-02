module SoundCloud
  module Track
    class Info < SoundCloud::Track::Base
      private

      def track_data
        track_base_data
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          title: title,
          soundcloud_id: soundcloud_id,
          player_id: player_id,
          artist: artist_formatted,
          artists: artists
        }
      end

      def track_extra_data
        {
          image: image_data,
          duration: duration,
          description: description_truncated,
          tags: tags.first(5),
          audio: audio_data
        }
      end

      def image_data
        image_data_formatted(
          track['artwork_url'], 'track'
        )
      end

      def tags_list
        [track['genre']].compact
      end

      def audio_data
        {
          present: audio_present?,
          link: audio_link,
          source_id: SOURCE_ID
        }
      end

      def audio_link
        "#{link}/stream?client_id=#{client_id}"
      end
    end
  end
end
