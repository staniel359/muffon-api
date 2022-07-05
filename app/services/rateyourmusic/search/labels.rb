module RateYourMusic
  module Search
    class Labels < RateYourMusic::Search::Base
      COLLECTION_NAME = 'labels'.freeze
      SEARCH_TYPE = 'b'.freeze
      TOTAL_LIMIT = 200

      private

      def collection_item_data_formatted(label)
        RateYourMusic::Search::Labels::Label.call(
          label:
        )
      end
    end
  end
end
