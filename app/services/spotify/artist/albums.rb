module Spotify
  module Artist
    class Albums < Spotify::Artist::Base
      COLLECTION_NAME = 'albums'.freeze
      ALBUM_TYPES = {
        'album' => 'album',
        'single' => 'single',
        'compilation' => 'compilation',
        'appearance' => 'appears_on'
      }.freeze

      include Spotify::Utils::Pagination

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

      def collection_list
        artist['items']
      end

      def link
        "#{super}/albums"
      end

      def params
        {
          **super,
          include_groups: album_type
        }
      end

      def album_type
        ALBUM_TYPES[
          @args[:album_type]
        ]
      end

      def total_items_count
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
