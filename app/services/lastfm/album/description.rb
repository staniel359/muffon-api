module LastFM
  module Album
    class Description < LastFM::Album::Base
      private

      def album_data
        {
          title: title,
          artist: artist_data,
          description: description
        }
      end
    end
  end
end
