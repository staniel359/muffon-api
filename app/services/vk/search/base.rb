module VK
  module Search
    class Base < VK::Web
      private

      def primary_args
        [@args.query]
      end

      def no_data?
        super || results.blank?
      end

      def data
        { search: search_data }
      end
    end
  end
end
