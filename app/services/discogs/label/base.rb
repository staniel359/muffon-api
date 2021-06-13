module Discogs
  module Label
    class Base < Discogs::Base
      include Discogs::Utils::Artist

      private

      def primary_args
        [@args.label_id]
      end

      def link
        "#{BASE_LINK}/labels/#{@args.label_id}"
      end

      def data
        { label: label_data }
      end

      def artist
        @artist ||= response_data
      end
    end
  end
end
