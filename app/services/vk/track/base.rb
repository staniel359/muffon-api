module VK
  module Track
    class Base < VK::Base
      API_METHOD = 'audio.getById'.freeze

      include VK::Utils::Track

      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          track_id
        ]
      end

      def not_found?
        track.blank?
      end

      def track
        response_data.try(
          :[], 0
        )
      end

      def params
        {
          **super,
          audios: vk_track_id
        }
      end

      def vk_track_id
        @args[:track_id]
      end

      def signature
        "/method/#{API_METHOD}" \
          "?access_token=#{access_token}" \
          '&v=5.131' \
          "&audios=#{vk_track_id}" \
          "#{api_secret}"
      end

      def data
        { track: track_data }
      end
    end
  end
end
