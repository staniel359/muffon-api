module Genius
  module Album
    class Links < Genius::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Links.call(
          source_original_link:,
          source_name:,
          source_album_id: genius_id
        )
      end
    end
  end
end
