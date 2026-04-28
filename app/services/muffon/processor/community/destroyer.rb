module Muffon
  module Processor
    module Community
      class Destroyer < Muffon::Processor::Community::Base
        private

        def required_args
          [
            *super,
            :community_id
          ]
        end

        def forbidden?
          super || !community_creator?
        end

        def data
          community_record.destroy!

          { success: true }
        end
      end
    end
  end
end
