module Discogs
  module Artist
    class Albums < Discogs::Artist::Base
      COLLECTION_NAME = 'albums'.freeze

      include Discogs::Utils::Pagination

      private

      def artist_data
        {
          **super,
          **paginated_data
        }
      end

      def collection_list
        artist['releases']
      end

      def link
        "#{super}/#{@args[:artist_id]}/releases"
      end

      def params
        {
          **super,
          sort: 'year',
          sort_order: 'desc'
        }
      end

      def total_items_count
        artist.dig(
          'pagination',
          'items'
        )
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
