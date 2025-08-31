module Muffon
  module Processor
    module Community
      module Post
        module Comment
          class Updater < Muffon::Processor::Post::Comment::Updater
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
                !post_comment_creator?
            end

            def post_comment_params
              {
                **super,
                by_community: by_community?
              }
            end
          end
        end
      end
    end
  end
end
