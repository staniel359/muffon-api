module Genius
  module Artist
    class Albums < Genius::Artist::Base
      private

      def artist_data
        {
          **super,
          **albums_data
        }
      end

      def albums_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def raw_collection
        artist.dig(
          'response',
          'albums'
        )
      end

      def link
        "#{super}/albums"
      end

      def params
        {
          **super,
          page:,
          per_page: limit
        }
      end

      def collection_item_data_formatted(album)
        Genius::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
