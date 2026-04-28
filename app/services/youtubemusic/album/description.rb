module YouTubeMusic
  module Album
    class Description < YouTubeMusic::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Description.call(
          description:
        )
      end
    end
  end
end
