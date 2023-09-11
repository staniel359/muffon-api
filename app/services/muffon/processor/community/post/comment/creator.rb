module Muffon
  module Processor
    module Community
      module Post
        module Comment
          class Creator < Muffon::Processor::Post::Comment::Creator
            private

            def primary_args
              super + [
                @args[:community_id]
              ]
            end

            def no_data?
              super || community.blank?
            end

            def post_comment_params
              super.merge(
                community_params
              )
            end

            def community_params
              {
                post_id: @args[:post_id],
                community_id:
                  @args[:community_id],
                by_community: by_community?
              }
            end
          end
        end
      end
    end
  end
end
