module Discogs
  module Utils
    class Length < Discogs::Base
      def call
        data
      end

      private

      def data
        length.split(':').map(&:to_i).inject { |m, s| m * 60 + s }.to_i
      end

      def length
        @args.length.to_s
      end
    end
  end
end
