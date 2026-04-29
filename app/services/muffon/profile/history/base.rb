module Muffon
  module Profile
    module History
      class Base < Muffon::Profile::Base
        DEFAULT_ORDER = 'created_desc'.freeze

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
