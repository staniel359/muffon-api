module LastFM
  module Artist
    class Description < LastFM::Artist::API::Base
      private

      def artist_data
        {
          name: response_data['name'],
          description: description
        }
      end
    end
  end
end
