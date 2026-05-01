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
        raw_artist_data['collection']
      end

      def request_url
        "#{super}/albums"
      end

      def request_params
        {
          **super,
          limit: PAGE_LIMIT
        }
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        SoundCloud::Artist::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
