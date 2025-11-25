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

      def collection_item_data_formatted(artist)
        LastFM::Top::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token],
          minimal: @args[:minimal]
        )
      end
    end
  end
end
