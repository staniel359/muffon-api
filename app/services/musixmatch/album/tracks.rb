module MusixMatch
  module Album
    class Tracks < MusixMatch::Album::Base
      PAGE_LIMIT = 200

      private

      def not_found?
        false
      end

      def album_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:
        )
      end

      def raw_collection
        response_data.dig(
          'message',
          'body',
          'track_list'
        )
      end

      def link
        "#{BASE_LINK}/album.tracks.get"
      end

      def params
        {
          **super,
          page_size: PAGE_LIMIT
        }
      end

      def items_count
        response_data.dig(
          'message',
          'header',
          'available'
        )
      end

      def collection_item_data_formatted(track)
        MusixMatch::Album::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
