module Muffon
  module Token
    class Validator < Muffon::Base
      def call
        data
      end

      private

      def data
        profile.present? || anonymous_token?
      end

      def token
        @args[:token]
      end

      def profile
        ::Profile.find_by(
          token:
        )
      end

      def anonymous_token?
        token == secrets.anonymous[:token]
      end
    end
  end
end
