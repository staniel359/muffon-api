module Muffon
  module Processor
    module Community
      class Destroyer < Muffon::Processor::Community::Base
        private

        def primary_args
          super + [
            @args[:community_id]
          ]
        end

        def process_community
          community&.destroy

          { success: true }
        end
      end
    end
  end
end
