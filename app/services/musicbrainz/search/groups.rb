module MusicBrainz
  module Search
    class Groups < MusicBrainz::Search::Base
      COLLECTION_NAME = 'groups'.freeze
      MODEL_NAME = 'release-group'.freeze

      private

      def collection_item_data_formatted(group)
        MusicBrainz::Search::Groups::Group.call(
          group:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
