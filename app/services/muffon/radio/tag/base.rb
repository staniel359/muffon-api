module Muffon
  module Radio
    module Tag
      class Base < Muffon::Radio::Base
        private

        def primary_args
          [@args[:tag_name]]
        end
      end
    end
  end
end
