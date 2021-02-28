module Helpers
  module Odnoklassniki
    module Utils
      class << self
        def session_id
          Rails.application.credentials.odnoklassniki[:test_session_id]
        end
      end
    end
  end
end
