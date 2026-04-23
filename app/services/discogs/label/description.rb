module Discogs
  module Label
    class Description < Discogs::Label::Info
      private

      def label_data
        Muffon::Formatter::Label::Description.call(
          description:
        )
      end
    end
  end
end
