module Muffon
  module Token
    class Validator < Muffon::Base
      def call
        data
      end

      private

      def data
        token.present? && (
          profile.present? ||
            allowed_token?
        )
      end

      def token
        @args[:token]
      end

      def profile
        ::Profile.find_by(
          token:
        )
      end

      def allowed_token?
        token.in?(
          secrets.tokens
        )
      end
    end
  end
end
