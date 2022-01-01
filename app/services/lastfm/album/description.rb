module LastFM
  module Album
    class Description < LastFM::Album::Info
      private

      def album_data
        { description: }
      end
    end
  end
end
