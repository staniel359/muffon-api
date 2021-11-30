module API
  module V1
    module Discogs
      class GroupsController < API::V1::BaseController
        def info
          render_data_with_status
        end

        def description
          render_data_with_status
        end

        def tags
          render_data_with_status
        end

        def albums
          render_data_with_status
        end

        private

        def info_data
          ::Discogs::Group::Info.call(
            params.slice(
              *%i[group_id profile_id]
            )
          )
        end

        def description_data
          ::Discogs::Group::Description.call(
            params.slice(:group_id)
          )
        end

        def tags_data
          ::Discogs::Group::Tags.call(
            params.slice(:group_id)
          )
        end

        def albums_data
          ::Discogs::Group::Albums.call(
            params.slice(
              *%i[group_id profile_id page limit]
            )
          )
        end
      end
    end
  end
end
