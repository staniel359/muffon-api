module Odnoklassniki
  module Album
    class Links < Odnoklassniki::Album::Info
      private

      def album_data
        { links: source_links }
      end
    end
  end
end
