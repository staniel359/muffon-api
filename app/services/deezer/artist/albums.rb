module Deezer
  module Artist
    class Albums < Deezer::Artist::Base
      API_METHOD = 'album.getDiscography'.freeze
      ALBUM_TYPES = {
        album: '1',
        single: '0'
      }.freeze
      COLLECTION_NAME = 'albums'.freeze

      include Muffon::Utils::Pagination

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
          Deezer::Artist::Info.call(
            artist_id: @args[:artist_id]
          )[:artist]
      end

      def albums_list
        response_data.dig(
          'results', 'data'
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

      def artist_data
        super.merge(
          paginated_data
        )
      end

      def name
        artist_info_data[:name]
      end

      def total_items_count
        @total_items_count ||=
          albums_list_filtered_sorted.size
      end

      def albums_list_filtered_sorted
        @albums_list_filtered_sorted ||=
          albums_list_filtered.sort_by do |a|
            a['ORIGINAL_RELEASE_DATE']
          end.reverse
      end

      def albums_list_filtered
        albums_list.select do |a|
          a['TYPE'] == album_type_id
        end
      end

      def album_type_id
        ALBUM_TYPES[
          @args[:album_type].to_sym
        ]
      end

      def collection_list
        collection_paginated(
          albums_list_filtered_sorted
        )
      end

      def collection_item_data_formatted(album)
        Deezer::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
