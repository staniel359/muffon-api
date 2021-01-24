module LastFM
  module Album
    class ListenersCount < LastFM::Album::Base
      private

      def album_data
        {
          title: response_data['name'],
          artist: artist_data,
          listeners_count: response_data['listeners'].to_i
        }
      end
    end
  end
end
