module LastFM
  module Album
    class ListenersCount < LastFM::Album::Base
      private

      def album_data
        {
          title: title,
          artist: artist_formatted,
          listeners_count: listeners_count
        }
      end
    end
  end
end
