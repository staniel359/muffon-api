module LastFM
  module Track
    class Info < LastFM::Track::Base
      private

      def params
        super.merge(lang_params)
      end

      def track_data
        muffon_data
          .merge(track_base_data)
          .merge(track_extra_data)
          .merge(track_description_tags_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          player_id: player_id,
          source_id: SOURCE_ID,
          title: title,
          artists: artists
        }
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          listeners_count: listeners_count,
          plays_count: plays_count,
          duration: duration,
          duration_seconds: duration_seconds
        }.compact
      end

      def album_data
        return if album.blank?

        {
          source_id: SOURCE_ID,
          title: album['title']
        }
      end

      def album
        @album ||= track['album']
      end

      def image_data
        image_data_formatted(
          image, 'track'
        )
      end

      def image
        track.dig(
          'album', 'image', -1, '#text'
        )
      end

      def listeners_count
        track['listeners'].to_i
      end

      def plays_count
        track['playcount'].to_i
      end

      def duration_seconds
        track['duration'].to_i / 1_000
      end

      def track_description_tags_data
        {
          description: description_truncated,
          tags: tags&.first(5)
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

        [raw_tags].flatten
      end

      def raw_tags
        track.dig(
          'toptags', 'tag'
        )
      end
    end
  end
end
