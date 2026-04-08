module Spotify
  module Utils
    class AudioToken < Spotify::Utils::Token
      private

      def cookies
        {
          **super,
          **audio_cookies
        }
      end

      def audio_cookies
        credentials.dig(
          :spotify,
          :audio_cookies
        )
      end
    end
  end
end
