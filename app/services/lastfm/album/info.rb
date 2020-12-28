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
        album_base_data.merge(album_extra_data)
      end

      def album_base_data
        {
          title: response_data['name'],
          artist: artist_name,
          mbid: response_data['mbid'].to_s
        }
      end

      def artist_name
        response_data['artist']
      end

      def album_extra_data
        {
          images: images,
          listeners_count: response_data['listeners'].to_i,
          plays_count: response_data['playcount'].to_i,
          description: description,
          tags: tags,
          tracks: tracks
        }
      end

      def images
        LastFM::Utils::ImagesData.call(
          data: response_data, model: 'album'
        )
      end

      def description
        return '' if response_data['wiki'].blank?

        response_data.dig('wiki', 'content').match(
          %r{(.+)<a href="http(s?)://www.last.fm}m
        )[1].strip
      end

      def tags
        response_data.dig('tags', 'tag').map { |t| t['name'] }
      end

      def tracks
        response_data.dig('tracks', 'track').map do |t|
          {
            id: track_id(artist_name, track_title(t)),
            title: track_title(t),
            length: t['duration'].to_i
          }
        end
      end

      def track_title(track)
        track['name']
      end
    end
  end
end
