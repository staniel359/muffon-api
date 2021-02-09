module Yandex
  module Music
    module Paginated
      include Muffon::Paginated

      private

      def paginated_data
        {
          page: page,
          total_pages: total_pages,
          collection_name.to_sym => send("#{collection_name}_data")
        }
      end
    end
  end
end
