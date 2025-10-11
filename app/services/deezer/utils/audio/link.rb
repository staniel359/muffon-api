module Deezer
  module Utils
    module Audio
      class Link < Deezer::Base
        include Muffon::Utils::Audio::Link

        private

        def required_args
          %i[
            track_id
          ]
        end

        def audio_binary_data
          @audio_binary_data ||=
            Deezer::Utils::Audio::Decrypter.call(
              track_id: @args[:track_id]
            )
        end
      end
    end
  end
end
