module SoundCloud
  module Album
    class Description < SoundCloud::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Description.call(
          description:
        )
      end
    end
  end
end
