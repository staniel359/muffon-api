module LastFM
  module Artist
    class Info < LastFM::Artist::Base
      private

      def params
        super.merge(lang_params)
      end

      def artist_data
        muffon_data
          .merge(base_artist_data)
          .merge(with_more_data)
      end

      def base_artist_data
        {
          id: id,
          name: name,
          listeners_count: listeners_count,
          plays_count: plays_count,
          description: description_truncated,
          tags: tags
        }.compact
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
        return [] if artist['tags'].blank?

        [
          artist.dig('tags', 'tag')
        ].flatten
      end
    end
  end
end
