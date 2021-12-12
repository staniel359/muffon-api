module Muffon
  module Profile
    module Follower
      class Creator < Muffon::Profile::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token],
            @args[:other_profile_id]
          ]
        end

        def data
          return forbidden if wrong_profile?

          relationship

          return errors_data if errors?

          { success: true }
        end

        def relationship
          @relationship ||=
            profile.active_relationships.where(
              other_profile_id: @args[:other_profile_id]
            ).first_or_create
        end

        def errors?
          relationship.errors.any?
        end

        def errors
          relationship.errors_formatted
        end
      end
    end
  end
end
