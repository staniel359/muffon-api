module Muffon
  module Processor
    module Community
      module Post
        module Comment
          class Creator < Muffon::Processor::Post::Comment::Creator
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

            def post_comment_params
              {
                **super,
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
