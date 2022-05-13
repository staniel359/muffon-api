module Bandcamp
  module Label
    class Artists < Bandcamp::Label::Base
      COLLECTION_NAME = 'artists'.freeze

      private

      def raw_collection_list
        response_data['artists']
      end

      def collection_item_data_formatted(artist)
        Bandcamp::Label::Artists::Artist.call(
          artist:
        )
      end
    end
  end
end
