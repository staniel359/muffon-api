module Bandcamp
  module Label
    class Albums < Bandcamp::API::Artist::Base
      include Bandcamp::Paginated

      private

      def data
        { label: label_data.merge(paginated_data) }
      end

      def label_data
        { name: response_data['name'] }
      end

      def collection_name
        'albums'
      end
    end
  end
end
