module LastFM
  module Track
    class Info < LastFM::API
      private

      def service_info
        {
          api_method: 'track.getInfo',
          response_data_node: 'track'
        }
      end

      def primary_args
        [@args.artist, @args.track]
      end

      def data
        { track: track_data }
      end

      def track_data
        {
          title: response_data['name'],
          artist: response_data.dig('artist', 'name'),
          mbid: response_data['mbid'] || '',
          length: length,
          listeners_count: response_data['listeners'].to_i,
          plays_count: response_data['playcount'].to_i,
          description: description,
          album: album, tags: tags
        }
      end

      def length
        response_data['duration'].to_i / 1_000
      end

      def description
        return '' if response_data['wiki'].blank?

        response_data.dig('wiki', 'content').match(
          %r{(.+)<a href="http(s?)://www.last.fm}m
        )[1].strip
      end

      def album
        return {} if response_data['album'].blank?

        {
          title: response_data.dig('album', 'title'),
          cover: cover
        }
      end

      def cover
        response_data.dig(
          'album', 'image'
        ).last['#text'].sub('/300x300', '')
      end

      def tags
        response_data.dig('toptags', 'tag').map { |t| t['name'] }
      end
    end
  end
end
