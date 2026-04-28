module Odnoklassniki
  module Album
    class Links < Odnoklassniki::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Links.call(
          source_original_link:,
          source_name:,
          source_album_id: odnoklassniki_id
        )
      end
    end
  end
end
