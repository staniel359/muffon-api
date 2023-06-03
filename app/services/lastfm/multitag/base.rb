module LastFM
  module Multitag
    class Base < LastFM::Kerve::Base
      TOTAL_LIMIT = 10_000

      include Muffon::Utils::Pagination

      private

      def not_all_args?
        super || !tags_is_array?
      end

      def primary_args
        [@args[:tags]]
      end

      def tags_is_array?
        @args[:tags].is_a?(Array)
      end

      def no_data?
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
        RestClient::ParamsArray.new(
          raw_params
        )
      end

      def raw_params
        [
          *tags_params,
          [:type, model_name],
          [:nr, total_limit],
          [:format, 'json']
        ]
      end

      def tags_params
        @args[:tags].map do |t|
          [:f, "tag:#{t}"]
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
