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

        def no_data?
          community.blank?
        end

        def community
          @community ||=
            profile.own_communities.find_by(
              id: @args[:community_id]
            )
        end

        def data
          return forbidden if wrong_profile?

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
