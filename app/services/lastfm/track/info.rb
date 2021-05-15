module LastFM
  module Track
    class Info < LastFM::Track::Base
      private

      def service_info
        {
          api_method: 'track.getInfo',
          response_data_node: 'track'
        }
      end

      def track_data
        track_base_data.merge(track_extra_data)
      end

      def track_base_data
        {
          id: track_id(artist_name, title),
          title: title,
          artist: artist_data
        }
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data(album, 'track'),
          listeners_count: listeners_count,
          plays_count: plays_count,
          length: length,
          description: description_truncated,
          tags: tags
        }
      end

      def album_data
        return {} if album.blank?

        { title: album['title'] }
      end

      def album
        response_data['album']
      end

      def listeners_count
        response_data['listeners'].to_i
      end

      def plays_count
        response_data['playcount'].to_i
      end

      def length
        response_data['duration'].to_i / 1_000
      end

      def tags_list
        response_data.dig('toptags', 'tag')
      end
    end
  end
end
