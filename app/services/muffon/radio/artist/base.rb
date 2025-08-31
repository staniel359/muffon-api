module Muffon
  module Radio
    module Artist
      class Base < Muffon::Radio::Base
        private

        def required_args
          %i[
            artist_name
          ]
        end
      end
    end
  end
end
