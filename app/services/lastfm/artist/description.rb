module LastFM
  module Artist
    class Description < LastFM::Artist::API::Base
      private

      def artist_data
        {
          name: title,
          description: description
        }
      end
    end
  end
end
