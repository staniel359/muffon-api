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

        def process_community
          update_community

          return community.errors_data if
              community.errors?

          process_image

          { community: community_data }
        end

        def update_community
          community.title = @args[:title]

          if @args[:description].present?
            community.description =
              @args[:description]
          end

          community.save
        end

        def community_data
          Muffon::Communities::Community.call(
            community:
          )
        end
      end
    end
  end
end
