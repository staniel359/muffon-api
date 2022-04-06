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
          super || community.blank?
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
