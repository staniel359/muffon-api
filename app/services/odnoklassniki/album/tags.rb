module Odnoklassniki
  module Album
    class Tags < Odnoklassniki::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Tags.call(
          tags:
        )
      end
    end
  end
end
