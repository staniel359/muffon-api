module MusicBrainz
  module Artist
    class Albums < MusicBrainz::Base
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

      def primary_args
        [
          @args[:artist_id],
          @args[:album_type]
        ]
      end

      def no_data?
        artist_info_data.blank?
      end

      def artist_info_data
        @artist_info_data ||=
          MusicBrainz::Artist::Info.call(
            artist_id: @args[:artist_id]
          )[:artist]
      end

      def link
        "#{BASE_LINK}/release-group"
      end

      def params
        super
          .merge(albums_params)
          .merge(pagination_params)
      end

      def albums_params
        {
          artist: @args[:artist_id],
          type: album_type,
          inc: 'artist-credits'
        }
      end

      def album_type
        ALBUM_TYPES[
          @args[:album_type].to_sym
        ]
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        artist_info_data
          .merge(paginated_data)
      end

      def total_items_count
        response_data[
          'release-group-count'
        ]
      end

      def collection_list
        response_data[
          'release-groups'
        ]
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
