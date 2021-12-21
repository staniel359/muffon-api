module VK
  module Track
    class Base < VK::Base
      API_METHOD = 'audio.getById'.freeze
      include VK::Utils::Track

      private

      def primary_args
        [@args[:track_id]]
      end

      def no_data?
        track.blank?
      end

      def track
        @track ||=
          response_data.try(:[], 0)
      end

      def params
        super.merge(
          track_params
        )
      end

      def track_params
        { audios: vk_track_id }
      end

      def vk_track_id
        @args[:track_id]
      end

      def signature
        "/method/#{API_METHOD}"\
          "?access_token=#{access_token}"\
          '&v=5.131'\
          "&audios=#{vk_track_id}"\
          "#{api_secret}"
      end

      def data
        { track: track_data }
      end
    end
  end
end
