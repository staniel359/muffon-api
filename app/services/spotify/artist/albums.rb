module Spotify
  module Artist
    class Albums < Spotify::Artist::Base
      ALBUM_TYPES = {
        album: 'album',
        single: 'single',
        compilation: 'compilation',
        appearance: 'appears_on'
      }.freeze
      COLLECTION_NAME = 'albums'.freeze
      include Spotify::Utils::Pagination

      private

      def primary_args
        [
          @args.artist_id,
          @args.album_type
        ]
      end

      def no_data?
        collection_list.blank?
      end

      def collection_list
        @collection_list ||= response_data['items']
      end

      def link
        "#{super}/albums"
      end

      def params
        super.merge(albums_params)
      end

      def albums_params
        { include_groups: album_type }
      end

      def album_type
        ALBUM_TYPES[
          @args.album_type.to_sym
        ]
      end

      def artist_data
        super.merge(paginated_data)
      end

      def name
        Spotify::Artist::Info.call(
          artist_id: @args.artist_id
        ).dig(:artist, :name)
      end

      def total_items_count
        response_data['total']
      end

      def collection_item_data_formatted(album)
        Spotify::Artist::Albums::Album.call(
          album: album,
          profile_id: @args.profile_id
        )
      end
    end
  end
end
