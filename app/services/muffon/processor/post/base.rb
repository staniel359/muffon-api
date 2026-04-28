module Muffon
  module Processor
    module Post
      class Base < Muffon::Processor::Profile::Base
        include Muffon::Mixins::Sendable

        def post_creator?
          post_record.creator?(
            profile_id: @args[:profile_id]
          )
        end

        def post_record
          if defined?(@post_record)
            @post_record
          else
            @post_record =
              ::Post.find_by(
                id: @args[:post_id]
              )
          end
        end

        def page_creator?
          post_record.other_profile_id == @args[:profile_id].to_i
        end

        def community_creator?
          community_record.creator?(
            profile_id: @args[:profile_id]
          )
        end

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

        def by_community?
          @args[:by_community].present? &&
            community_creator?
        end

        alias post_params sendable_params
      end
    end
  end
end
