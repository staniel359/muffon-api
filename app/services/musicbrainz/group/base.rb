module MusicBrainz
  module Group
    class Base < MusicBrainz::Base
      def call
        check_args

        data
      rescue Faraday::BadRequestError
        raise not_found_error
      end

      private

      def required_args
        %i[
          group_id
        ]
      end

      def request_url
        "#{REQUEST_BASE_URL}/release-group/#{@args[:group_id]}"
      end

      def data
        { group: group_data }
      end

      alias raw_album_group_data response_data
    end
  end
end
