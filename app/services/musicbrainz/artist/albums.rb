module MusicBrainz
  module Artist
    class Albums < MusicBrainz::Artist::Base
      ALBUM_TYPES = {
        album: 'album',
        single: 'single',
        ep: 'ep',
        compilation: 'compilation',
        live: 'live',
        misc: 'other'
      }.freeze
      COLLECTION_NAME = 'albums'.freeze
      MODEL_NAME = 'release-group'.freeze

      include MusicBrainz::Utils::Pagination

      private

      def required_args
        super + %i[
          album_type
        ]
      end

      def artist_data
        {
          **super,
          **paginated_data
        }
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
          **pagination_params
        }
      end

      def album_type
        ALBUM_TYPES[
          @args[:album_type].to_sym
        ]
      end

      def total_items_count
        artist['release-group-count']
      end

      def collection_list
        artist['release-groups']
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
