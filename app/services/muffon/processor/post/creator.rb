module Muffon
  module Processor
    module Post
      class Creator < Muffon::Processor::Post::Base
        private

        def required_args
          [
            *super,
            *content_args
          ]
        end

        def data
          post_record

          if post_record.errors?
            post_record.errors_data
          else
            post_record.process_images(
              @args[:images]
            )

            { post: post_data }
          end
        end

        def post_record
          @post_record ||=
            profile_record
            .own_posts
            .create(
              post_params
            )
        end

        def post_data
          Muffon::Formatter::Posts::Post.call(
            post_record:,
            **self_args
          )
        end
      end
    end
  end
end
