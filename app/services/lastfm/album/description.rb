module LastFM
  module Album
    class Description < LastFM::Album::Base
      private

      def album_data
        {
          title: response_data['name'],
          artist: artist_data,
          description: description
        }
      end
    end
  end
end
