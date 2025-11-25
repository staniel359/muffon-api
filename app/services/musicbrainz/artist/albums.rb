module MusicBrainz
  module Artist
    class Albums < MusicBrainz::Artist::Base
      ALBUMS_TYPES = {
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
        artist['release-groups']
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
        ALBUMS_TYPES[@args[:album_type]]
      end

      def items_count
        artist['release-group-count']
      end

      def collection_item_data_formatted(album)
        MusicBrainz::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
