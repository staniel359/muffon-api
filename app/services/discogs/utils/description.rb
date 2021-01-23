module Discogs
  module Utils
    class Description < Discogs::Base
      def call
        data
      end

      private

      def data
        groups_gsub.gsub(/\[.*?\]/, '')
      end

      def groups_gsub
        artists_gsub.gsub(
          /\[m=(.*?)\]/,
          'https://www.discogs.com/master/\1'
        )
      end

      def artists_gsub
        @args.description.to_s.gsub(/\[a=(.*?)\]/, '\1')
      end
    end
  end
end
