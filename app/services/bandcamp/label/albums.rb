module Bandcamp
  module Label
    class Albums < Bandcamp::Label::Base
      COLLECTION_NAME = 'albums'.freeze

      private

      def raw_collection_list
        response_data['discography']
      end

      def collection_item_data_formatted(album)
        Bandcamp::Label::Albums::Album.call(
          album:
        )
      end
    end
  end
end
