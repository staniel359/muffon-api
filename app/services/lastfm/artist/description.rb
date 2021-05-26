module LastFM
  module Artist
    class Description < LastFM::Artist::Base
      private

      def artist_data
        { description: description }
      end
    end
  end
end
