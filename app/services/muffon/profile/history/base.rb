module Muffon
  module Profile
    module History
      class Base < Muffon::Profile::Base
        DEFAULT_ORDER = 'created_desc'.freeze

        private

        def forbidden?
          !valid_profile?
        end
      end
    end
  end
end
