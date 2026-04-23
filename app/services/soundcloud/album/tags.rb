module SoundCloud
  module Album
    class Tags < SoundCloud::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Tags.call(
          tags:
        )
      end
    end
  end
end
