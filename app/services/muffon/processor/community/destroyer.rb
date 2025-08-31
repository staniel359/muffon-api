module Muffon
  module Processor
    module Community
      class Destroyer < Muffon::Processor::Community::Base
        private

        def required_args
          super + %i[
            community_id
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
          community&.destroy

          { success: true }
        end
      end
    end
  end
end
