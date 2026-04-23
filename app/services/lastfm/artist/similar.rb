module LastFM
  module Artist
    class Similar < LastFM::Artist::Base
      API_METHOD = 'artist.getSimilar'.freeze
      PAGE_LIMIT = 200

      private

      def not_found?
        super || name.blank?
      end

      def raw_artist_data
        response_data['similarartists']
      end

      def params
        {
          **super,
          limit: PAGE_LIMIT
        }
      end

      def name
        raw_artist_data.dig(
          '@attr',
          'artist'
        )
      end

      def artist_data
        {
          **super,
          **similar_data
        }
      end

      def similar_data
        paginated_data(
          collection_name: 'similar',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true
        )
      end

      def raw_collection
        raw_artist_data['artist']
      end

      def items_count
        raw_artist_data
          .dig(
            '@attr',
            'total'
          )
          .to_i
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        LastFM::Artist::Similar::Artist.call(
          raw_artist_data:,
          is_minimal: @args[:is_minimal],
          **self_args
        )
      end
    end
  end
end
