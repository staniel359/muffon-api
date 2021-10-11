module VK
  module Utils
    module Audio
      class File < VK::Base
        include Muffon::Utils::Audio::File

        private

        def primary_args
          [
            @args.track_id,
            @args.link
          ]
        end

        def audio_binary_data
          RestClient::Request.execute(
            method: :get,
            url: @args.link,
            raw_response: true
          )
        end
      end
    end
  end
end
