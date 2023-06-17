module LastFM
  module Kerve
    class Base < LastFM::Base
      BASE_LINK =
        'https://kerve.last.fm/kerve'.freeze

      include Muffon::Utils::Pagination

      private

      def charts_link
        "#{BASE_LINK}/charts"
      end

      def similar_artists_link
        "#{BASE_LINK}/similarartists"
      end

      def search_link
        "#{BASE_LINK}/search"
      end

      def params
        {
          type: model_name,
          nr: total_limit,
          f: f_param
        }.compact
      end

      def model_name
        self.class::MODEL_NAME
      end

      def total_limit
        self.class::TOTAL_LIMIT
      end

      def total_items_count
        @total_items_count ||=
          raw_collection_list.size
      end

      def raw_collection_list
        response_data.dig(
          'results', model_name
        )
      end

      def collection_list
        collection_paginated(
          raw_collection_list
        )
      end
    end
  end
end
