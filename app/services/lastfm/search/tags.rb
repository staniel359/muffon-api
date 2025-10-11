module LastFM
  module Search
    class Tags < LastFM::Search::Base
      COLLECTION_NAME = 'tags'.freeze

      private

      def required_args
        %i[
          query
        ]
      end

      def response_data
        @response_data ||=
          Google::Search.call(
            params
          ).try(
            :[],
            :search
          ) || {}
      end

      def params
        {
          query: @args[:query],
          scope: 'lastfm_tags',
          page: @args[:page]
        }
      end

      def page
        response_data[:page]
      end

      def total_pages_count
        response_data[:total_pages]
      end

      def collection_list
        raw_collection_list.reject do |t|
          t[:title].blank?
        end
      end

      def raw_collection_list
        response_data[:results] || []
      end

      def collection_item_data_formatted(tag)
        LastFM::Search::Tags::Tag.call(
          tag:
        )
      end
    end
  end
end
