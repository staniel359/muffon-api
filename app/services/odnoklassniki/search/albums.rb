module Odnoklassniki
  module Search
    class Albums < Odnoklassniki::Search::Base
      COLLECTION_NAME = 'albums'.freeze
      ENDPOINT_NAME = 'albums'.freeze
      TOTAL_LIMIT = 200

      private

      def collection_item_data_formatted(album)
        Odnoklassniki::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
