module LastFM
  module Artist
    class ListenersCount < LastFM::Artist::Info
      private

      def artist_data
        {
          name: name,
          listeners_count: listeners_count
        }
      end
    end
  end
end
