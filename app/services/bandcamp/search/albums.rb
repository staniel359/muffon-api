module Bandcamp
  module Search
    class Albums < Bandcamp::Search::Base
      MODEL_NAME = 'album'.freeze
      COLLECTION_NAME = 'albums'.freeze

      private

      def collection_item_data_formatted(album)
        Bandcamp::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
