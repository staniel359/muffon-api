module Genius
  module Artist
    class Albums < Genius::Artist::Base
      COLLECTION_NAME = 'albums'.freeze
      include Muffon::Utils::Pagination

      private

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

      def artist_data
        super.merge(paginated_data)
      end

      def name
        Genius::Artist::Info.call(
          artist_id: @args.artist_id
        ).dig(:artist, :name)
      end
    end
  end
end
