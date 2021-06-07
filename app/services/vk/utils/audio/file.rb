module VK
  module Utils
    module Audio
      class File < VK::Base
        include Muffon::Utils::Audio::File

        private

        def primary_args
          [
            @args.link,
            @args.track_id
          ]
        end

        def audio_binary_data
          RestClient.get(raw_audio_link)
        end

        def raw_audio_link
          VK::Utils::Audio::Link.call(
            link: @args.link
          )
        end
      end
    end
  end
end
