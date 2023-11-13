module Muffon
  module Radio
    module Artist
      class Base < Muffon::Radio::Base
        private

        def primary_args
          [@args[:artist_name]]
        end
      end
    end
  end
end
