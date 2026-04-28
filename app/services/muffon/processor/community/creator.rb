module Muffon
  module Processor
    module Community
      class Creator < Muffon::Processor::Community::Base
        private

        def required_args
          [
            *super,
            :title
          ]
        end

        def data
          community_record

          if community_record.errors?
            community_record.errors_data
          else
            community_record.process_image(
              @args[:image]
            )

            create_membership!

            { community: community_data }
          end
        end

        def community_record
          @community_record ||=
            profile_record
            .own_communities
            .where(
              title: @args[:title]
            )
            .create(
              community_params
            )
        end

        def community_params
          { description: @args[:description] }
        end

        def create_membership!
          community_record.add_member!(
            profile_id: @args[:profile_id]
          )
        end

        def community_data
          { id: community_record.id }
        end
      end
    end
  end
end
