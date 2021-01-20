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
          source: 'lastfm'
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
          description: description_truncated,
          tags: tags,
          tracks: tracks
        }
      end

      def images
        LastFM::Utils::Images.call(
          data: response_data, model: 'album'
        )
      end

      def tags
        response_data.dig('tags', 'tag').map { |t| t['name'] }
      end

      def tracks
        response_data.dig('tracks', 'track').map do |t|
          {
            id: track_id(artist_name, t['name']),
            title: t['name'],
            length: t['duration'].to_i
          }
        end
      end
    end
  end
end
