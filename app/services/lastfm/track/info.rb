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
        track_base_data.merge(track_extra_data)
      end

      def track_base_data
        {
          id: track_id(artist_name, track_title),
          title: track_title,
          artist: artist_name,
          mbid: response_data['mbid'].to_s
        }
      end

      def artist_name
        response_data.dig('artist', 'name')
      end

      def track_title
        response_data['name']
      end

      def track_extra_data
        {
          album: response_data.dig('album', 'title').to_s,
          images: images,
          listeners_count: response_data['listeners'].to_i,
          plays_count: response_data['playcount'].to_i,
          length: response_data['duration'].to_i / 1_000,
          description: description,
          tags: tags
        }
      end

      def images
        LastFM::Utils::ImagesData.call(
          data: response_data['album'], model: 'album'
        )
      end

      def description
        return '' if response_data['wiki'].blank?

        response_data.dig('wiki', 'content').match(
          %r{(.+)<a href="http(s?)://www.last.fm}m
        )[1].strip
      end

      def tags
        response_data.dig('toptags', 'tag').map { |t| t['name'] }
      end
    end
  end
end
