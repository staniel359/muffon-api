module LastFM
  module Artist
    class Info < LastFM::Artist::Base
      private

      def artist_data
        artist_base_data
          .merge(with_more_data)
      end

      def artist_base_data
        {
          name: name,
          listeners_count: listeners_count,
          plays_count: plays_count,
          description: description_truncated,
          tags: tags
        }
      end

      def listeners_count
        artist.dig(
          'stats', 'listeners'
        ).to_i
      end

      def plays_count
        artist.dig(
          'stats', 'playcount'
        ).to_i
      end

      def description
        description_formatted(
          artist.dig('bio', 'content')
        )
      end

      def tags_list
        artist.dig('tags', 'tag')
      end
    end
  end
end
