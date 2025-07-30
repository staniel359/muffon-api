module API
  module Spotify
    class AudioController < API::BaseController
      def secret; end

      private

      def secret_data
        ::Spotify::Utils::Audio::Link::Token::Secret.call(
          extra_token: params[:extra_token]
        )
      end
    end
  end
end
