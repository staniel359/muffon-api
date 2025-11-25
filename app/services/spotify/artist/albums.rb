module Spotify
  module Artist
    class Albums < Spotify::Artist::Base
      ALBUMS_TYPES = {
        'album' => 'album',
        'single' => 'single',
        'compilation' => 'compilation',
        'appearance' => 'appears_on'
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
        artist['items']
      end

      def link
        "#{super}/albums"
      end

      def params
        {
          **super,
          include_groups: album_type,
          limit:,
          offset:
        }.compact
      end

      def album_type
        ALBUMS_TYPES[@args[:album_type]]
      end

      def items_count
        artist['total']
      end

      def collection_item_data_formatted(album)
        Spotify::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
