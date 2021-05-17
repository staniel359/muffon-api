module LastFM
  module Artist
    class Info < LastFM::Artist::API::Base
      private

      def artist_data
        artist_base_data
          .merge(artist_extra_data)
          .merge(with_more_data)
      end

      def artist_base_data
        { name: title }
      end

      def artist_extra_data
        {
          listeners_count: listeners_count,
          plays_count: plays_count,
          description: description_truncated,
          tags: tags
        }
      end

      def listeners_count
        response_data.dig('stats', 'listeners').to_i
      end

      def plays_count
        response_data.dig('stats', 'playcount').to_i
      end

      def tags_list
        response_data.dig('tags', 'tag')
      end
    end
  end
end
