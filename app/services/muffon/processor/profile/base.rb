module Muffon
  module Processor
    module Profile
      class Base < Muffon::Profile::Base
        private

        def required_args
          [
            *super,
            :token
          ]
        end

        def forbidden?
          !valid_profile?
        end
      end
    end
  end
end
