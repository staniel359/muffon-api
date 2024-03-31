module VK
  module Utils
    module Audio
      class Link < VK::Base
        include Muffon::Utils::Audio::Link

        private

        def primary_args
          [
            @args[:track_id],
            @args[:link]
          ]
        end

        def audio_binary_data
          @audio_binary_data ||=
            format_get_request(
              link: @args[:link]
            ).body
        end
      end
    end
  end
end
