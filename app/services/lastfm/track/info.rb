module LastFM
  module Track
    class Info < LastFM::API
      private

      def primary_args
        [@args.artist, @args.track]
      end

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('track.getInfo')
        )['track']
      end

      def data
        { track: track_data }
      end

      def track_data
        {
          title: parsed_response['name'],
          artist: parsed_response.dig('artist', 'name'),
          mbid: parsed_response['mbid'] || '',
          length: length,
          listeners_count: parsed_response['listeners'].to_i,
          plays_count: parsed_response['playcount'].to_i,
          album: album, tags: tags,
          description: description
        }
      end

      def length
        parsed_response['duration'].to_i / 1_000
      end

      def album
        return {} if parsed_response['album'].blank?

        {
          title: parsed_response.dig('album', 'title'),
          cover: cover
        }
      end

      def cover
        parsed_response.dig(
          'album', 'image'
        ).last['#text'].sub('/300x300', '')
      end

      def tags
        parsed_response.dig('toptags', 'tag').map { |t| t['name'] }
      end

      def description
        return '' if parsed_response['wiki'].blank?

        parsed_response.dig('wiki', 'content').match(
          %r{(.+)<a href="http(s?)://www.last.fm}m
        )[1].strip
      end
    end
  end
end
