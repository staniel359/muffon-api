module Odnoklassniki
  module Album
    class Links < Odnoklassniki::Album::Info
      private

      def album_data
        { links: source_links_data }
      end
    end
  end
end
