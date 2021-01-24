module LastFM
  module Artist
    class Info < LastFM::Artist::API::Base
      private

      def artist_data
        {
          name: response_data['name'],
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

      def tags
        tags_list.map { |t| t['name'] }
      end

      def tags_list
        response_data.dig('tags', 'tag')
      end
    end
  end
end
