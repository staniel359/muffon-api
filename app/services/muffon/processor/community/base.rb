module Muffon
  module Processor
    module Community
      class Base < Muffon::Processor::Profile::Base
        private

        def community_record
          if defined?(@community_record)
            @community_record
          else
            @community_record =
              ::Community.find_by(
                id: @args[:community_id]
              )
          end
        end

        def community_creator?
          community_record.creator?(
            profile_id: @args[:profile_id]
          )
        end
      end
    end
  end
end
