module Audius
  module Album
    class Links < Audius::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Links.call(
          source_original_link:,
          source_name:,
          source_album_id: audius_id
        )
      end
    end
  end
end
