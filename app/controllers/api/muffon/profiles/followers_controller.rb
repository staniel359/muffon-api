module API
  module Muffon
    module Profiles
      class FollowersController < API::Muffon::ProfilesController
        def index
          render_data_with_status
        end

        def create
          render_data_with_status
        end

        def destroy
          render_data_with_status
        end

        private

        def index_data
          ::Muffon::Profile::Followers.call(
            params.slice(
              *%i[profile_id other_profile_id page limit]
            )
          )
        end

        def create_data
          ::Muffon::Processor::Profile::Follower::Creator.call(
            params.slice(
              *%i[profile_id token other_profile_id]
            )
          )
        end

        def destroy_data
          ::Muffon::Processor::Profile::Follower::Destroyer.call(
            params.slice(
              *%i[profile_id token other_profile_id]
            )
          )
        end
      end
    end
  end
end
