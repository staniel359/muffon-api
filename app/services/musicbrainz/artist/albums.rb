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
        super + %i[
          album_type
        ]
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

      def link
        "#{BASE_LINK}/release-group"
      end

      def params
        {
          **super,
          artist: @args[:artist_id],
          type: album_type,
          inc: 'artist-credits',
          limit:,
          offset:
        }
      end

      def album_type
        ALBUMS_TYPES_DATA[@args[:album_type]]
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
