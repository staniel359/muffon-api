module Audius
  module Album
    class Description < Audius::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Description.call(
          description:
        )
      end
    end
  end
end
