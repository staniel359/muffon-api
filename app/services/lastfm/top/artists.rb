module LastFM
  module Top
    class Artists < LastFM::Top::Base
      private

      def top_data
        paginated_data(
          collection_name: 'artists',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count: MAXIMUM_ITEMS_COUNT
        )
      end

      def raw_collection
        response_data.dig(
          collection_name,
          'artist'
        )
      end

      def api_method
        if country_code.present?
          'geo.getTopArtists'
        else
          'chart.getTopArtists'
        end
      end

      def collection_name
        if country_code.present?
          'topartists'
        else
          'artists'
        end
      end

      def items_count
        response_data
          .dig(
            collection_name,
            '@attr',
            'total'
          ).to_i
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        LastFM::Top::Artists::Artist.call(
          raw_artist_data:,
          is_minimal: @args[:is_minimal],
          **self_args
        )
      end
    end
  end
end
