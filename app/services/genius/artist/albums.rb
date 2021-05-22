module Genius
  module Artist
    class Albums < Genius::Artist::Base
      COLLECTION_NAME = 'albums'.freeze
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args.artist_id]
      end

      def no_data?
        collection_list.blank?
      end

      def collection_list
        @collection_list ||= response_data.dig(
          'response', 'albums'
        )
      end

      def link
        "#{super}/albums"
      end

      def params
        {
          page: page,
          per_page: limit
        }
      end

      def collection_item_data_formatted(album)
        Genius::Artist::Albums::Album.call(
          album: album
        )
      end

      alias artist_data paginated_data
    end
  end
end
