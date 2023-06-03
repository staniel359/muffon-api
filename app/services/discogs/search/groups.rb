module Discogs
  module Search
    class Groups < Discogs::Search::Base
      COLLECTION_NAME = 'groups'.freeze
      COLLECTION_TYPE = 'master'.freeze

      private

      def collection_item_data_formatted(group)
        Discogs::Search::Groups::Group.call(
          group:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
