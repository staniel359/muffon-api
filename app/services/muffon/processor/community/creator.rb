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

          return community.errors_data if community.errors?

          process_image

          { community: community_data }
        end

        def community
          @community ||=
            profile
            .own_communities
            .where(
              title: @args[:title]
            ).create(
              community_params
            )
        end

        def community_params
          { description: @args[:description] }
        end

        def community_data
          { id: community.id }
        end
      end
    end
  end
end
