module VK
  module Search
    class Base < VK::Base
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args.query]
      end

      def no_data?
        collection_list.blank?
      end

      def collection_list
        @collection_list ||= response_data['items']
      end

      def params
        super.merge(search_params)
      end

      def signature
        "/method/#{api_method}"\
          "?access_token=#{access_token}"\
          '&v=5.131'\
          "&q=#{@args.query}"\
          "&count=#{limit}"\
          "&offset=#{offset}"\
          "#{api_secret}"
      end

      def search_params
        {
          q: @args.query,
          count: limit,
          offset: offset
        }
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          page: page,
          collection_name => collection_formatted
        }
      end

      def collection_name
        self.class::COLLECTION_NAME.to_sym
      end

      def collection_formatted
        collection_list.map do |a|
          collection_item_data_formatted(a)
        end
      end
    end
  end
end
