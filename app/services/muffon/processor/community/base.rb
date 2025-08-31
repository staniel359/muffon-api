module Muffon
  module Processor
    module Community
      class Base < Muffon::Processor::Profile::Base
        private

        def community
          if instance_variable_defined?(
            :@community
          )
            @community
          else
            @community =
              ::Community.find_by(
                id: community_id
              )
          end
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
