module Spotify
  module Utils
    module Audio
      class Link < Spotify::Base
        FILE_EXTENSION = 'ogg'.freeze

        include Muffon::Utils::Audio::Link

        private

        def primary_args
          [@args[:track_id]]
        end

        def audio_binary_data
          @audio_binary_data ||=
            Spotify::Utils::Audio::Decrypter.call(
              track_id: @args[:track_id]
            )
        end
      end
    end
  end
end
