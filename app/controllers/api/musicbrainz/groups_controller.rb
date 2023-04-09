module API
  module MusicBrainz
    class GroupsController < API::BaseController
      def info; end

      def description; end

      def tags; end

      def albums; end

      private

      def info_data
        ::MusicBrainz::Group::Info.call(
          params.slice(
            *%i[group_id profile_id token]
          )
        )
      end

      def description_data
        ::MusicBrainz::Group::Description.call(
          params.slice(
            *%i[group_id]
          )
        )
      end

      def tags_data
        ::MusicBrainz::Group::Tags.call(
          params.slice(
            *%i[group_id]
          )
        )
      end

      def albums_data
        ::MusicBrainz::Group::Albums.call(
          params.slice(
            *%i[group_id profile_id token page limit]
          )
        )
      end
    end
  end
end
