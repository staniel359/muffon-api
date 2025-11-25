module LastFM
  module Top
    class Tracks < LastFM::Top::Base
      private

      def top_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count: MAXIMUM_ITEMS_COUNT
        )
      end

      def raw_collection
        response_data.dig(
          'tracks',
          'track'
        )
      end

      def api_method
        if country_code.present?
          'geo.getTopTracks'
        else
          'chart.getTopTracks'
        end
      end

      def items_count
        response_data
          .dig(
            'tracks',
            '@attr',
            'total'
          ).to_i
      end

      def collection_item_data_formatted(track)
        LastFM::Top::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
