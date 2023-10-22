module Deezer
  module Utils
    module Audio
      class Link < Deezer::Base
        include Muffon::Utils::Audio::Link

        private

        def primary_args
          [@args[:track_id]]
        end

        def audio_binary_data
          return 'test' if test?

          @audio_binary_data ||=
            Deezer::Utils::Audio::Decoder.call(
              track_id: @args[:track_id]
            )
        end
      end
    end
  end
end
