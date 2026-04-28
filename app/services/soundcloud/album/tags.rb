module SoundCloud
  module Album
    class Tags < SoundCloud::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Tags.call(
          tags:
        )
      end
    end
  end
end
