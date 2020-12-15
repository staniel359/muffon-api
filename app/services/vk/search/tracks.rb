module VK
  module Search
    class Tracks < VK::Search::Base
      private

      def request_params
        {
          act: 'load_section',
          al: 1,
          playlist_id: playlist_id,
          owner_id: secrets.vk[:page_id],
          offset: @args.next_page
        }
      end

      def playlist_id
        albums_data.dig(:search, :albums, -1, :vk_id)
      end

      def albums_data
        VK::Search::Albums.call(query: @args.query)
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
        VK::Search::Tracks::Track.call(track: track)
      end
    end
  end
end
