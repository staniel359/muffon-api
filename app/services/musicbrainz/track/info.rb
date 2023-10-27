module MusicBrainz
  module Track
    class Info < MusicBrainz::Track::Base
      private

      def track_data
        track_base_data
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
          album: album_data,
          image: image_data,
          profiles_count:,
          release_date:,
          tags: tags_truncated
        }.compact_blank
      end

      def release_date
        date_formatted(
          track['first-release-date']
        )
      end

      def tags_list
        track['tags']
      end
    end
  end
end
