module VK
  module Album
    class Base < VK::Base
      API_METHOD = 'audio.getPlaylistById'.freeze

      def call
        # TODO: to remove later
        raise not_found_error unless test?

        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          album_id
          owner_id
          access_key
        ]
      end

      def not_found?
        raw_album_data.blank?
      end

      def data
        { album: album_data }
      end

      alias raw_album_data response_data
    end
  end
end
