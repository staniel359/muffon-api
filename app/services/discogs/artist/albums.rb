module Discogs
  module Artist
    class Albums < Discogs::Base
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
          @args.artist_id,
          @args.album_type
        ]
      end

      def response_data
        @response_data ||= Nokogiri::HTML.parse(
          response
        )
      end

      def link
        'https://www.discogs.com'\
          "/artist/#{@args.artist_id}"
      end

      def params
        {
          type: 'Releases',
          subtype: album_type,
          page: page
        }
      end

      def album_type
        ALBUM_TYPES_DATA[
          @args.album_type.to_sym
        ]
      end

      def data
        { artist: paginated_data }
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
          album: album
        )
      end
    end
  end
end
