module Muffon
  module Radio
    module Artist
      class Base < Muffon::Radio::Base
        private

        def primary_args
          [@args[:artist_name]]
        end

        def no_data?
          artist_info_data.blank? || super
        end
      end
    end
  end
end
