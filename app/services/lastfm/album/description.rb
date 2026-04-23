module LastFM
  module Album
    class Description < LastFM::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Description.call(
          description:
        )
      end
    end
  end
end
