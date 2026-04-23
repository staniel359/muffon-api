module Discogs
  module Group
    class Base < Discogs::Base
      def call
        check_args

        data
      rescue Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          group_id
        ]
      end

      def link
        "#{BASE_LINK}/masters/#{@args[:group_id]}"
      end

      def data
        { group: group_data }
      end

      alias raw_album_group_data response_data
    end
  end
end
