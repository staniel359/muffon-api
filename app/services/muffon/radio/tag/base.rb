module Muffon
  module Radio
    module Tag
      class Base < Muffon::Radio::Base
        private

        def required_args
          %i[
            tag_name
          ]
        end
      end
    end
  end
end
