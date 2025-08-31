module Bandcamp
  module Label
    class Base < Bandcamp::Base
      include Muffon::Utils::Pagination

      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          label_id
        ]
      end

      def params
        { band_id: @args[:label_id] }
      end

      def data
        { label: paginated_data }
      end

      def total_items_count
        @total_items_count ||=
          raw_collection_list.size
      end

      def collection_list
        collection_paginated(
          raw_collection_list
        )
      end

      alias link artist_label_link
    end
  end
end
