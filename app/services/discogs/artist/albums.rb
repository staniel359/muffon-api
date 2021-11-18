module Discogs
  module Artist
    class Albums < Discogs::Artist::Base
      ALBUM_TYPES_DATA = {
        album: 'Albums',
        single_ep: 'Singles-EPs',
        compilation: 'Compilations',
        video: 'Videos',
        misc: 'Miscellaneous'
      }.freeze
      COLLECTION_NAME = 'albums'.freeze
      PAGE_LIMIT = 25
      include Discogs::Utils::Pagination

      private

      def primary_args
        [
          @args[:artist_id],
          @args[:album_type]
        ]
      end

      def params
        {
          type: 'Releases',
          subtype: album_type,
          page: page,
          sort: 'year,desc'
        }
      end

      def album_type
        ALBUM_TYPES_DATA[
          @args[:album_type].to_sym
        ]
      end

      def artist_data
        super.merge(paginated_data)
      end

      def name
        response_data.css(
          'meta[property="og:title"]'
        )[0]['content']
      end

      def total_items_count
        total_items_node.text.match(
          /of (\d+)/
        )[1].to_i
      end

      def total_items_node
        response_data.css(
          '.pagination_total'
        )[0]
      end

      def limit
        PAGE_LIMIT
      end

      def collection_list
        response_data.css('.card')
      end

      def collection_item_data_formatted(album)
        Discogs::Artist::Albums::Album.call(
          album: album,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
