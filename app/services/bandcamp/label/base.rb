module Bandcamp
  module Label
    class Base < Bandcamp::API::Creator::Base
      include Bandcamp::Paginated

      private

      def bandcamp_creator_id
        @args.label_id
      end

      def data
        { label: label_data.merge(paginated_data) }
      end

      def label_data
        { name: response_data['name'] }
      end
    end
  end
end
