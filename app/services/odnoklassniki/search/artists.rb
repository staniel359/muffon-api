module Odnoklassniki
  module Search
    class Artists < Odnoklassniki::Search::Base
      COLLECTION_NAME = 'artists'.freeze
      ENDPOINT_NAME = 'artists'.freeze

      private

      def collection_list
        @collection_list ||= [
          first_artist,
          *super
        ].compact
      end

      def first_artist
        response_data.dig(
          'bestMatch',
          'artist'
        )
      end

      def collection_item_data_formatted(artist)
        Odnoklassniki::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
