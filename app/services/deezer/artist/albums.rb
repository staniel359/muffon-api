module Deezer
  module Artist
    class Albums < Deezer::Artist::Base
      API_METHOD = 'album.getDiscography'.freeze
      ALBUM_TYPES = {
        'album' => '1',
        'single' => '0'
      }.freeze
      COLLECTION_NAME = 'albums'.freeze

      include Muffon::Utils::Pagination

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

      def raw_albums
        artist.dig(
          'results',
          'data'
        )
      end

      def payload
        {
          art_id: @args[:artist_id],
          discography_mode: 'all',
          filter_role_id: ['0'],
          lang: language,
          nb: '200'
        }.to_json
      end

      def total_items_count
        raw_albums_filtered_sorted.size
      end

      def raw_albums_filtered_sorted
        @raw_albums_filtered_sorted ||=
          raw_albums_filtered
          .sort_by do |raw_album_data|
            raw_album_data['ORIGINAL_RELEASE_DATE']
          end
          .reverse
      end

      def raw_albums_filtered
        raw_albums.select do |raw_album_data|
          raw_album_data['TYPE'] == album_type_id
        end
      end

      def album_type_id
        ALBUM_TYPES[
          @args[:album_type]
        ]
      end

      def collection_list
        collection_paginated(
          raw_albums_filtered_sorted
        )
      end

      def collection_item_data_formatted(album)
        Deezer::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
