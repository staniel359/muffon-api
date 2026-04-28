module Muffon
  module Processor
    module Post
      class Destroyer < Muffon::Processor::Post::Base
        private

        def required_args
          [
            *super,
            :post_id
          ]
        end

        def data
          post_record.destroy!

          { success: true }
        end
      end
    end
  end
end
