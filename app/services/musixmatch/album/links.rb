module MusixMatch
  module Album
    class Links < MusixMatch::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Links.call(
          source_original_link:,
          source_name:,
          source_album_id: nil,
          source_album_slug: musixmatch_slug
        )
      end
    end
  end
end
