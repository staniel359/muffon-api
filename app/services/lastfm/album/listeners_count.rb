module LastFM
  module Album
    class ListenersCount < LastFM::Album::Info
      private

      def album_data
        { listeners_count: }
      end
    end
  end
end
