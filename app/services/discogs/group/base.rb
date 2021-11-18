module Discogs
  module Group
    class Base < Discogs::Album::Base
      include Discogs::Utils::Album

      private

      def primary_args
        [@args[:group_id]]
      end

      def link
        "#{BASE_LINK}/masters/#{@args[:group_id]}"
      end

      def data
        { group: group_data }
      end

      def album
        @album ||= response_data
      end
    end
  end
end
