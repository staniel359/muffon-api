module LastFM
  module Track
    class Info < LastFM::Track::Base
      private

      def params
        super.merge(
          language_params
        )
      end

      def track_data
        muffon_data
          .merge(track_base_data)
          .merge(track_counters_data)
          .merge(track_extra_data)
          .merge(track_description_tags_data)
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

      def track_counters_data
        {
          listeners_count:
            track['listeners'].to_i,
          plays_count:
            track['playcount'].to_i,
          profiles_count:
        }.compact
      end

      def profiles_count
        find_track
          .library_tracks
          .size
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          duration:,
          duration_seconds:
        }.compact
      end

      def album_data
        return if album.blank?

        {
          source: album_source_data,
          title: album['title']
        }
      end

      def album
        track['album']
      end

      def album_source_data
        { name: source_name }
      end

      def image_data
        image_data_formatted(
          image
        )
      end

      def image
        track.dig(
          'album', 'image',
          -1, '#text'
        )
      end

      def duration_seconds
        track['duration'].to_i / 1_000
      end

      def track_description_tags_data
        {
          description:
            description_truncated,
          tags: tags_truncated
        }
      end

      def description
        description_formatted(
          raw_description
        )
      end

      def raw_description
        track.dig(
          'wiki', 'content'
        )
      end

      def tags_list
        return [] if track['toptags'].blank?

        [raw_tags_list].flatten
      end

      def raw_tags_list
        track.dig(
          'toptags', 'tag'
        )
      end
    end
  end
end
