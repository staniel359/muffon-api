module Deezer
  module Utils
    class Base < Deezer::Base
      private

      def user_tokens
        @user_tokens ||= Tokens::User.call
      end
    end
  end
end
