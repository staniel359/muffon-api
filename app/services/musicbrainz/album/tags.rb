module MusicBrainz
  module Album
    class Tags < MusicBrainz::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Tags.call(
          tags:
        )
      end
    end
  end
end
