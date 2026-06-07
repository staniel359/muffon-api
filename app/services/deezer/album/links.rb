module Deezer
  module Album
    class Links < Deezer::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Links.call(
          source_original_link:,
          source_name:,
          source_album_id: deezer_id
        )
      end
    end
  end
end
