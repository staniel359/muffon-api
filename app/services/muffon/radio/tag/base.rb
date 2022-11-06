module Muffon
  module Radio
    module Tag
      class Base < Muffon::Radio::Base
        private

        def primary_args
          [@args[:tag]]
        end

        def no_data?
          tag_info_data.blank? || super
        end

        def tag_random_page
          return 1 if test?

          rand(
            1..pages_count
          )
        end
      end
    end
  end
end
