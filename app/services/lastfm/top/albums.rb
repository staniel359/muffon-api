module LastFM
  module Top
    class Albums < LastFM::Top::Base
      def call
        super
      rescue Faraday::BadRequestError
        raise not_found_error
      end

      private

      def top_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count: MAXIMUM_ITEMS_COUNT
        )
      end

      def raw_collection
        response_data.dig(
          'albums',
          'album'
        )
      end

      def api_method
        if country_code.present?
          'geo.getTopAlbums'
        else
          'chart.getTopAlbums'
        end
      end

      def items_count
        response_data
          .dig(
            'albums',
            '@attr',
            'total'
          ).to_i
      end

      def collection_item_data_formatted(album)
        LastFM::Top::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
