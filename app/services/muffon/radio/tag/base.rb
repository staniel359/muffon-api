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
      end
    end
  end
end
