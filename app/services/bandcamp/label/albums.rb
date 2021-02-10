module Bandcamp
  module Label
    class Albums < Bandcamp::Label::Base
      private

      def collection_name
        'albums'
      end
    end
  end
end
