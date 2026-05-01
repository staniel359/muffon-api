module LastFM
  module Tag
    class Tracks < LastFM::Tag::Base
      API_METHOD = 'tag.getTopTracks'.freeze

      private

      def not_found?
        super || raw_collection.blank?
      end

      def raw_tag_data
        response_data['tracks']
      end

      def raw_collection
        raw_tag_data['track']
      end

      def request_params
        {
          **super,
          page:,
          limit:
        }
      end

      def tag_data
        {
          **super,
          **tracks_data
        }
      end

      def name
        raw_tag_data.dig(
          '@attr',
          'tag'
        )
      end

      def tracks_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count: MAXIMUM_ITEMS_COUNT
        )
      end

      def items_count
        raw_tag_data.dig(
          '@attr',
          'total'
        ).to_i
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        LastFM::Tag::Tracks::Track.call(
          raw_track_data:,
          **self_args
        )
      end
    end
  end
end
