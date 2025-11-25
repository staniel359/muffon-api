module LastFM
  module Tag
    class Tracks < LastFM::Tag::Base
      API_METHOD = 'tag.getTopTracks'.freeze

      private

      def not_found?
        super ||
          raw_collection.blank?
      end

      def raw_collection
        tag['track']
      end

      def tag
        response_data['tracks']
      end

      def params
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
        tag.dig(
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
        tag.dig(
          '@attr',
          'total'
        ).to_i
      end

      def collection_item_data_formatted(track)
        LastFM::Tag::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
