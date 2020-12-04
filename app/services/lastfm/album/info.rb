module LastFM
  module Album
    class Info < LastFM::API
      private

      def service_info
        {
          api_method: 'album.getInfo',
          response_data_node: 'album'
        }
      end

      def primary_args
        [@args.artist, @args.album]
      end

      def data
        { album: album_data }
      end

      def album_data
        {
          title: response_data['name'],
          artist: response_data['artist'],
          mbid: response_data['mbid'] || '',
          listeners_count: response_data['listeners'].to_i,
          plays_count: response_data['playcount'].to_i,
          description: description,
          images: images, tags: tags, tracks: tracks
        }
      end

      def description
        return '' if response_data['wiki'].blank?

        response_data.dig('wiki', 'content').match(
          %r{(.+)<a href="http(s?)://www.last.fm}m
        )[1].strip
      end

      def images
        LastFM::Utils::ImagesData.call(
          data: response_data, model: 'album'
        )
      end

      def tags
        response_data.dig('tags', 'tag').map { |t| t['name'] }
      end

      def tracks
        response_data.dig('tracks', 'track').map do |t|
          {
            id: track_id(t),
            title: t['name'],
            length: t['duration'].to_i
          }
        end
      end

      def track_id(track)
        ::Track.with_artist_id_title(artist_id, track['name']).id
      end

      def artist_id
        @artist_id ||=
          ::Artist.with_name(response_data['artist']).id
      end
    end
  end
end
