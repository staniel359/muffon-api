module Bandcamp
  module Artist
    class Albums < Bandcamp::API::Artist::Base
      include Bandcamp::Paginated

      private

      def data
        { artist: artist_data.merge(paginated_data) }
      end

      def artist_data
        { name: response_data['name'] }
      end

      def collection_name
        'albums'
      end
    end
  end
end
