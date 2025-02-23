module Muffon
  module Processor
    module Community
      class Base < Muffon::Profile::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token]
          ]
        end

        def community
          @community ||=
            ::Community.find_by(
              id: community_id
            )
        end

        def community_id
          @args[:community_id]
        end

        def community_creator?
          community.profile_id == profile.id
        end

        def data
          process_community
        end

        def process_image
          community.process_image(
            @args[:image]
          )
        end
      end
    end
  end
end
