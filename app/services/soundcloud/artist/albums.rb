module SoundCloud
  module Artist
    class Albums < SoundCloud::Artist::Base
      PAGE_LIMIT = 200

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
          is_fractioned: true
        )
      end

      def raw_collection
        artist['collection']
      end

      def link
        "#{super}/albums"
      end

      def params
        {
          **super,
          limit: PAGE_LIMIT
        }
      end

      def collection_item_data_formatted(album)
        SoundCloud::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
