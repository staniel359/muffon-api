module Genius
  module Artist
    class Albums < Genius::Artist::Base
      COLLECTION_NAME = 'albums'.freeze
      LIMIT = 50
      include Muffon::Utils::Pagination

      private

      def no_data?
        albums_list.blank? ||
          collection_list.blank?
      end

      def albums_list
        @albums_list ||= response_data.dig(
          'response', 'albums'
        )
      end

      def link
        "#{super}/albums"
      end

      def params
        super.merge(albums_params)
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
        super.merge(paginated_data)
      end

      def total_items_count
        albums_list.size
      end

      def name
        Genius::Artist::Info.call(
          artist_id: @args.artist_id
        ).dig(:artist, :name)
      end

      def collection_item_data_formatted(album)
        Genius::Artist::Albums::Album.call(
          album: album
        )
      end
    end
  end
end
