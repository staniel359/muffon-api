module Muffon
  module Profile
    module Post
      class Base < Muffon::Profile::Base
        private

        def required_args
          [
            *super,
            :post_id
          ]
        end

        def not_found?
          super || post_record.blank?
        end

        def post_record
          if defined?(@post_record)
            @post_record
          else
            @post_record =
              profile_record
              .own_posts
              .find_by(
                id: @args[:post_id]
              )
          end
        end

        def data
          { post: post_data }
        end
      end
    end
  end
end
