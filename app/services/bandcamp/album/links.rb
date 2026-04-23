module Bandcamp
  module Album
    class Links < Bandcamp::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Links.call(
          source_original_link:,
          source_name:,
          source_album_id: bandcamp_id
        )
      end
    end
  end
end
