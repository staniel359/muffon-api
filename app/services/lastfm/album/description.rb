module LastFM
  module Album
    class Description < LastFM::Album::Info
      private

      def album_data
        { description: description }
      end
    end
  end
end
