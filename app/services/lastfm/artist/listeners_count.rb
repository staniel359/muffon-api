module LastFM
  module Artist
    class ListenersCount < LastFM::Artist::Info
      private

      def artist_data
        find_artist.update(
          listeners_count:
        )

        {
          listeners_count:
            find_artist.listeners_count
        }
      end
    end
  end
end
