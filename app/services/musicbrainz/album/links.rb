module MusicBrainz
  module Album
    class Links < MusicBrainz::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Links.call(
          source_original_link:,
          source_name:,
          source_album_id: musicbrainz_id
        )
      end
    end
  end
end
