module LastFM
  module Album
    class ListenersCount < LastFM::Album::Info
      private

      def album_data
        update_listeners_count

        { listeners_count: }
      end
    end
  end
end
