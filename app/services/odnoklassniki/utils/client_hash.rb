module Odnoklassniki
  module Utils
    class ClientHash < Odnoklassniki::Base
      def call
        return '' if @args.md5.blank?

        data
      end

      private

      def data
        first.map.with_index do |n, i|
          (sum - third[i] * third[i + 1] * n).abs
        end.join
      end

      def first
        '43561287293571488343173598143728'.chars.map(&:to_i)
      end

      def sum
        @sum ||= second.sum
      end

      def second
        @second ||= digest.chars.map { |c| c.to_i(16) }
      end

      def digest
        Digest::MD5.hexdigest("#{@args.md5}secret")
      end

      def third
        @third ||= [second, second.last].flatten
      end
    end
  end
end