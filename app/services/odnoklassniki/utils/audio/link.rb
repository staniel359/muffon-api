module Odnoklassniki
  module Utils
    module Audio
      class Link < Odnoklassniki::Base
        STRING = '43561287293571488343173598143728'.freeze

        def call
          return '' if @args.link.blank?

          data
        end

        private

        def data
          "#{@args.link}&clientHash=#{client_hash}"
        end

        def client_hash
          first.map.with_index do |n, i|
            (sum - (third[i] * third[i + 1] * n)).abs
          end.join
        end

        def first
          STRING.chars.map(&:to_i)
        end

        def sum
          @sum ||= second.sum
        end

        def second
          @second ||= digest.chars.map do |c|
            c.to_i(16)
          end
        end

        def digest
          @digest ||= Digest::MD5.hexdigest(
            "#{md5}secret"
          )
        end

        def md5
          @md5 ||= Rack::Utils.parse_nested_query(
            @args.link
          )['md5']
        end

        def third
          @third ||= [second, second.last].flatten
        end
      end
    end
  end
end
