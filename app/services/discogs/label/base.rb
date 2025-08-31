module Discogs
  module Label
    class Base < Discogs::Base
      include Discogs::Utils::Artist

      def call
        check_args

        data
      rescue Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          label_id
        ]
      end

      def data
        { label: label_data }
      end

      def link
        "#{BASE_LINK}/labels/#{@args[:label_id]}"
      end

      alias artist response_data
    end
  end
end
