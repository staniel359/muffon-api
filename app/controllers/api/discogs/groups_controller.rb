module API
  module Discogs
    class GroupsController < API::BaseController
      def info; end

      def description; end

      def tags; end

      def albums; end

      private

      def info_data
        ::Discogs::Group::Info.call(
          params.slice(
            *%i[group_id profile_id token]
          )
        )
      end

      def description_data
        ::Discogs::Group::Description.call(
          params.slice(
            *%i[group_id]
          )
        )
      end

      def tags_data
        ::Discogs::Group::Tags.call(
          params.slice(
            *%i[group_id]
          )
        )
      end

      def albums_data
        ::Discogs::Group::Albums.call(
          params.slice(
            *%i[group_id profile_id token page limit]
          )
        )
      end
    end
  end
end
