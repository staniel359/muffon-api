module Muffon
  module Radio
    module Recommendations
      class Base < Muffon::Radio::Base
        include Muffon::Mixins::Profile

        def required_args
          %i[
            profile_id
            token
          ]
        end

        def forbidden?
          !valid_profile?
        end
      end
    end
  end
end
