module Muffon
  module Processor
    module Community
      class Creator < Muffon::Processor::Community::Base
        private

        def primary_args
          super + [
            @args[:title]
          ]
        end

        def process_community
          community

          return community.errors_data if
              community.errors?

          process_image

          { community_id: community.id }
        end

        def community
          @community ||=
            profile.own_communities.where(
              title: @args[:title]
            ).create(
              description: @args[:description]
            )
        end
      end
    end
  end
end
