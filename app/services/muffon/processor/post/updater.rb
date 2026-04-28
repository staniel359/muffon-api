module Muffon
  module Processor
    module Post
      class Updater < Muffon::Processor::Post::Base
        private

        def required_args
          [
            *super,
            *content_args,
            :post_id
          ]
        end

        def data
          post_record.update(
            post_params
          )

          if post_record.errors?
            post_record.errors_data
          else
            post_record.process_images(
              @args[:images]
            )

            { post: post_data }
          end
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
