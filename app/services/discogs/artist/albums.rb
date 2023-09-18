module Discogs
  module Artist
    class Albums < Discogs::Artist::Base
      BASE_LINK =
        'https://www.discogs.com/service' \
        '/catalog/api/graphql'.freeze
      ALBUM_TYPES = {
        album: 'Albums',
        single_ep: 'Singles & EPs',
        compilation: 'Compilations',
        misc: 'Miscellaneous'
      }.freeze
      COLLECTION_NAME = 'albums'.freeze
      PAGE_LIMIT = 25

      include Muffon::Utils::Pagination

      private

      def primary_args
        super + [
          @args[:album_type]
        ]
      end

      def no_data?
        artist_info_data.blank?
      end

      def artist_info_data
        @artist_info_data ||=
          Discogs::Artist::Info.call(
            artist_id: @args[:artist_id]
          )[:artist]
      end

      def params
        Discogs::Artist::Albums::Params.call(
          artist_id: @args[:artist_id],
          album_type:,
          page:,
          limit:
        )
      end

      def album_type
        ALBUM_TYPES[
          @args[:album_type].to_sym
        ]
      end

      def limit
        PAGE_LIMIT
      end

      def artist_data
        super.merge(
          paginated_data
        )
      end

      def name
        artist_info_data[:name]
      end

      def total_items_count
        release_type_data.try(
          :[], 'totalCount'
        ) || 0
      end

      def release_type_data
        release_types['facetDetails'].find do |f|
          f['facetName'] == album_type
        end
      end

      def release_types
        extra_data_items.find do |f|
          f['superFacetName'] == 'release_type'
        end
      end

      def extra_data_items
        response_data.dig(
          'data', 'artist', 'facets',
          'artistCreditFacets', 'facets'
        )
      end

      def collection_list
        response_data.dig(
          'data', 'artist', 'releases',
          'releaseGroups', 'releaseGroupsByHeader',
          0, 'releaseGroupDescriptions'
        ) || []
      end

      def collection_item_data_formatted(album)
        Discogs::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
