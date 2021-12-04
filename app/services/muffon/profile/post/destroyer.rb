module Muffon
  module Profile
    module Post
      class Destroyer < Muffon::Profile::Post::Base
        private

        def primary_args
          super << @args[:post_id]
        end

        def data
          return forbidden if wrong_profile?

          post&.destroy

          { success: true }
        end
      end
    end
  end
end
