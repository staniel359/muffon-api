module MusicBrainz
  module Artist
    class Albums < MusicBrainz::Artist::Base
      ALBUMS_TYPES_DATA = {
        'album' => 'album',
        'single' => 'single',
        'ep' => 'ep',
        'compilation' => 'compilation',
        'live' => 'live',
        'misc' => 'other'
      }.freeze

      private

      def required_args
        [
          *super,
          :albums_type
        ]
      end

      def wrong_args?
        albums_type.blank?
      end

      def albums_type
        ALBUMS_TYPES_DATA[@args[:albums_type]]
      end

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
          items_count:
        )
      end

      def raw_collection
        raw_artist_data['release-groups']
      end

      def request_url
        "#{REQUEST_BASE_URL}/release-group"
      end

      def request_params
        {
          **super,
          artist: @args[:artist_id],
          type: albums_type,
          inc: 'artist-credits',
          limit:,
          offset:
        }
      end

      def items_count
        raw_artist_data['release-group-count']
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        MusicBrainz::Artist::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
