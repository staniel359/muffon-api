module VK
  module Search
    class Tracks < VK::Search::Base
      private

      def request_params
        {
          act: 'load_section',
          al: 1,
          playlist_id: playlist_id,
          offset: @args.next_page
        }
      end

      def playlist_id
        albums_data.dig(:search, :albums, 0, :vk_id)
      end

      def albums_data
        VK::Search::Albums.call(query: @args.query, tracks: true)
      end

      def results
        @results ||= response_data.dig(1, 0)
      end

      def search_data
        {
          next_page: results['nextOffset'],
          tracks: tracks
        }
      end

      def tracks
        results['list'].map { |t| track_data(t) }
      end

      def track_data(track)
        {
          title: track_title(track),
          artist: track_artist_name(track),
          length: track[5],
          audio: audio_data(track)
        }
      end

      def audio_data(track)
        {
          present: audio_id(track).present?,
          id: audio_id(track),
          source: 'vk'
        }
      end
    end
  end
end
