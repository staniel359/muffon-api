module Muffon
  module Processor
    module Community
      class Updater < Muffon::Processor::Community::Base
        private

        def required_args
          [
            *super,
            :community_id,
            :title
          ]
        end

        def forbidden?
          super || !community_creator?
        end

        def data
          community_record.update(
            title: @args[:title],
            description: @args[:description]
          )

          if community_record.errors?
            community_record.errors_data
          else
            community_record.process_image(
              @args[:image]
            )

            { community: community_info_data }
          end
        end

        def community_info_data
          Muffon::Community::Info.call(
            community_id: @args[:community_id],
            **self_args
          )[:community]
        end
      end
    end
  end
end
