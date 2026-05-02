module LastFM
  module Album
    class ListenersCount < LastFM::Album::Info
      private

      def album_data
        update_album_record!

        { listeners_count: }
      end
    end
  end
end
