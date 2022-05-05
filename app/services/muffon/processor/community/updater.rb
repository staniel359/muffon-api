module Muffon
  module Processor
    module Community
      class Updater < Muffon::Processor::Community::Base
        private

        def primary_args
          super + [
            @args[:community_id],
            @args[:title]
          ]
        end

        def no_data?
          super || community.blank?
        end

        def community
          @community ||=
            profile.own_communities.find_by(
              id: @args[:community_id]
            )
        end

        def process_community
          update_community

          return community.errors_data if
              community.errors?

          process_image

          { community: community_data }
        end

        def update_community
          community.update(
            title: @args[:title],
            description: @args[:description]
          )
        end

        def community_data
          Muffon::Communities::Community.call(
            community:,
            profile_id: @args[:profile_id]
          )
        end
      end
    end
  end
end
