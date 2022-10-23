module Genius
  module Artist
    class Albums < Genius::Artist::Base
      COLLECTION_NAME = 'albums'.freeze
      LIMIT = 50
      include Muffon::Utils::Pagination

      private

      def no_data?
        artist_info_data.blank?
      end

      def artist_info_data
        @artist_info_data ||=
          Genius::Artist::Info.call(
            artist_id: @args[:artist_id]
          )[:artist]
      end

      def albums_list
        response_data.dig(
          'response', 'albums'
        )
      end

      def link
        "#{super}/albums"
      end

      def params
        super.merge(
          albums_params
        )
      end

      def albums_params
        { per_page: LIMIT }
      end

      def collection_list
        collection_paginated(
          albums_list
        )
      end

      def artist_data
        super.merge(
          paginated_data
        )
      end

      def total_items_count
        @total_items_count ||= albums_list.size
      end

      def name
        artist_info_data[:name]
      end

      def collection_item_data_formatted(album)
        Genius::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
