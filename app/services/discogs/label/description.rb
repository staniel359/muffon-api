module Discogs
  module Label
    class Description < Discogs::Label::Info
      private

      def label_data
        { description: }
      end
    end
  end
end
