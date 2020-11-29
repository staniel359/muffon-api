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
          id: id, title: track_title, artist: artist_name,
          mbid: response_data['mbid'] || '',
          listeners_count: response_data['listeners'].to_i,
          plays_count: response_data['playcount'].to_i,
          length: length, description: description,
          album: album, tags: tags
        }
      end

      def id
        ::Track.with_artist_id_title(artist_id, track_title).id
      end

      def artist_id
        ::Artist.with_name(artist_name).id
      end

      def artist_name
        response_data.dig('artist', 'name')
      end

      def track_title
        response_data['name']
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
          covers: covers
        }
      end

      def covers
        {
          original: cover.sub('/300x300', ''),
          large: cover.sub('/300x300', '/600x600'),
          medium: cover,
          small: cover.sub('/300x300', '/174s')
        }
      end

      def cover
        response_data.dig('album', 'image').last['#text']
      end

      def tags
        response_data.dig('toptags', 'tag').map { |t| t['name'] }
      end
    end
  end
end
