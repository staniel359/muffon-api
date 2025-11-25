module Bandcamp
  module Artist
    class Albums < Bandcamp::Artist::Base
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
          limit:,
          page:,
          is_fractioned: true
        )
      end

      def raw_collection
        artist['discography']
      end

      def collection_item_data_formatted(album)
        Bandcamp::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
