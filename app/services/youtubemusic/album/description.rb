module YouTubeMusic
  module Album
    class Description < YouTubeMusic::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Description.call(
          description:
        )
      end
    end
  end
end
