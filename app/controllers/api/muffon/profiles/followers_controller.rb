module API
  module Muffon
    module Profiles
      class FollowersController < API::Muffon::ProfilesController
        def index; end

        def create; end

        def destroy; end

        private

        def index_data
          ::Muffon::Profile::Followers.call(
            params.slice(
              *%i[
                profile_id other_profile_id
                token page limit
              ]
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
