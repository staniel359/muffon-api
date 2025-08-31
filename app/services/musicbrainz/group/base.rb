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

      def link
        "#{base_link}/release-group/#{@args[:group_id]}"
      end

      def base_link
        self.class::BASE_LINK
      end

      def data
        { group: group_data }
      end

      alias group response_data
    end
  end
end
