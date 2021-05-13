module Genius
  module Search
    class Tracks < Genius::Base
      include Muffon::Paginated

      private

      def primary_args
        [@args.query]
      end

      def no_data?
        tracks_list.empty?
      end

      def tracks_list
        @tracks_list ||= response_data.dig(
          'response', 'sections', 0, 'hits'
        )
      end

      def response_data
        JSON.parse(response)
      end

      def response
        RestClient.get(link, headers)
      end

      def link
        'https://genius.com/api/search/song'
      end

      def headers
        { params: params }
      end

      def params
        {
          q: @args.query,
          page: page,
          per_page: limit
        }
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          page: page,
          tracks: tracks_data
        }
      end

      def tracks_data
        tracks_list.map { |t| track_data(t['result']) }
      end

      def track_data(track)
        {
          title: track['title'],
          artist: artist_data(track),
          genius_id: track['path'].remove('/')
        }
      end

      def artist_data(track)
        { name: track.dig('primary_artist', 'name') }
      end
    end
  end
end
