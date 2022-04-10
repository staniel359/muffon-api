module LastFM
  module Album
    class ListenersCount < LastFM::Album::Info
      private

      def album_data
        find_album.update(
          listeners_count:
        )

        {
          listeners_count:
            find_album.listeners_count
        }
      end
    end
  end
end
