module Muffon
  module Processor
    module Community
      class Updater < Muffon::Processor::Community::Base
        private

        def required_args
          super + %i[
            community_id
            title
          ]
        end

        def not_found?
          super ||
            community.blank?
        end

        def forbidden?
          super ||
            !community_creator?
        end

        def process_community
          community.update(
            community_params
          )

          if community.errors?
            community.errors_data
          else
            process_image

            {
              community:
                community_info_data
            }
          end
        end

        def community_params
          {
            title: @args[:title],
            description: @args[:description]
          }
        end

        def community_info_data
          Muffon::Community::Info.call(
            community_id:,
            profile_id: @args[:profile_id],
            token: @args[:token]
          )[:community]
        end
      end
    end
  end
end
