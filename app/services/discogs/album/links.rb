module Discogs
  module Album
    class Links < Discogs::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Links.call(
          source_original_link:,
          source_name:,
          source_album_id: discogs_id
        )
      end
    end
  end
end
