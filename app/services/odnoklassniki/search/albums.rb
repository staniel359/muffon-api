module Odnoklassniki
  module Search
    class Albums < Odnoklassniki::Search::Base
      COLLECTION_NAME = 'albums'.freeze
      ENDPOINT_NAME = 'albums'.freeze

      private

      def collection_item_data_formatted(album)
        Odnoklassniki::Search::Albums::Album.call(
          album: album,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
