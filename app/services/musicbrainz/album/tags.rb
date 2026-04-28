module MusicBrainz
  module Album
    class Tags < MusicBrainz::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Tags.call(
          tags:
        )
      end
    end
  end
end
