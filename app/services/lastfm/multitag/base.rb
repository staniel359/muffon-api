module LastFM
  module Multitag
    class Base < LastFM::Kerve::Base
      TOTAL_LIMIT = 10_000

      include Muffon::Utils::Pagination

      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          tags
        ]
      end

      def not_found?
        raw_collection_list.blank?
      end

      def raw_collection_list
        response_data.dig(
          'results', model_name
        )
      end

      def model_name
        self.class::MODEL_NAME
      end

      def params
        {
          f: tags_formatted,
          type: model_name,
          nr: total_limit,
          format: 'json'
        }
      end

      def tags_formatted
        @args[:tags].map do |t|
          "tag:#{t}"
        end
      end

      def data
        { multitag: paginated_data }
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

      alias link charts_link
    end
  end
end
