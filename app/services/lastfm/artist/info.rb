module LastFM
  module Artist
    class Info < LastFM::API
      private

      def service_info
        {
          api_method: 'artist.getInfo',
          response_data_node: 'artist'
        }
      end

      def primary_args
        [@args.artist]
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        {
          name: response_data['name'],
          mbid: response_data['mbid'].to_s,
          listeners_count: response_data.dig('stats', 'listeners').to_i,
          plays_count: response_data.dig('stats', 'playcount').to_i,
          description: description_truncated,
          tags: tags,
          similar: similar
        }
      end

      def tags
        response_data.dig('tags', 'tag').map { |t| t['name'] }
      end

      def similar
        response_data.dig('similar', 'artist').map { |a| a['name'] }
      end
    end
  end
end
