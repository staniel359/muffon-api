module Muffon
  module AccessToken
    class Validator < Muffon::Base
      def call
        data
      end

      private

      def data
        access_token.present? && (
          profile_by_access_token.present? ||
            allowed_access_token?
        )
      end

      def access_token
        @args[:access_token]
      end

      def profile_by_access_token
        ::Profile.find_by(
          token: access_token
        )
      end

      def allowed_access_token?
        access_token.in?(
          credentials[:tokens]
        )
      end
    end
  end
end
