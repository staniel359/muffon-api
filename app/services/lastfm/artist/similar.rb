module LastFM
  module Artist
    class Similar < LastFM::Artist::Base
      API_METHOD = 'artist.getSimilar'.freeze
      PAGE_LIMIT = 200

      private

      def not_found?
        super ||
          name.blank?
      end

      def artist
        response_data['similarartists']
      end

      def params
        {
          **super,
          limit: PAGE_LIMIT
        }
      end

      def name
        artist.dig(
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
        artist['artist']
      end

      def items_count
        artist
          .dig(
            '@attr',
            'total'
          )
          .to_i
      end

      def collection_item_data_formatted(artist)
        LastFM::Artist::Similar::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token],
          minimal: @args[:minimal]
        )
      end
    end
  end
end
