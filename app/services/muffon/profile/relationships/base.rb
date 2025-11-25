module Muffon
  module Profile
    module Relationships
      class Base < Muffon::Profile::Base
        DEFAULT_ORDER = 'followed_desc'.freeze
      end
    end
  end
end
