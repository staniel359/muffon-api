module Deezer
  module Artist
    class Albums < Deezer::Artist::Base
      API_METHOD = 'album.getDiscography'.freeze
      ALBUMS_TYPES_DATA = {
        'album' => '1',
        'single' => '0'
      }.freeze
      PAGE_LIMIT = 200

      private

      def required_args
        [
          *super,
          :albums_type
        ]
      end

      def wrong_args?
        albums_type_id.blank?
      end

      def albums_type_id
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
          is_fractioned: true
        )
      end

      def raw_collection
        raw_albums_filtered
          .sort_by do |raw_album_data|
            raw_album_data['ORIGINAL_RELEASE_DATE']
          end
          .reverse
      end

      def raw_albums_filtered
        raw_albums.select do |raw_album_data|
          raw_album_data['TYPE'] == albums_type_id
        end
      end

      def raw_albums
        raw_artist_data.dig(
          'results',
          'data'
        )
      end

      def request_payload
        {
          art_id: @args[:artist_id],
          discography_mode: 'all',
          filter_role_id: ['0'],
          lang: language,
          nb: PAGE_LIMIT.to_s
        }.to_json
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        Deezer::Artist::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
