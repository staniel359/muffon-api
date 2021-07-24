module Muffon
  module Profile
    class Finder < Muffon::Profile::Base
      PARAMS = %i[
        email
        nickname
        gender
        birthdate
        country
        city
      ].freeze

      private

      def data
        { profile: profile_data }
      end
    end
  end
end
