module Discogs
  module Group
    class Base < Discogs::Base
      private

      def primary_args
        [@args.group_id]
      end

      def link
        group_link
      end

      def group_link
        "#{base_link}/masters/#{@args.group_id}"
      end
    end
  end
end
