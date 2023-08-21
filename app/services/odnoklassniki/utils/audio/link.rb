module Odnoklassniki
  module Utils
    module Audio
      class Link < Odnoklassniki::Base
        DECODE_STRING =
          '43561287293571488343173598143728'.freeze

        def call
          data
        end

        private

        def data
          return if @args[:link].blank?

          "#{@args[:link]}&clientHash=#{client_hash}"
        end

        def client_hash
          first_sequence
            .map
            .with_index do |number, index|
              first_sequence_item_formatted(
                number, index
              )
            end.join
        end

        def first_sequence
          DECODE_STRING
            .chars
            .map(
              &:to_i
            )
        end

        def first_sequence_item_formatted(number, index)
          multiplied =
            first_sequence_item_multiplied(
              number, index
            )

          (
            second_sequence_sum - multiplied
          ).abs
        end

        def first_sequence_item_multiplied(number, index)
          third_sequence[index] *
            third_sequence[index + 1] *
            number
        end

        def third_sequence
          @third_sequence ||= [
            second_sequence,
            second_sequence.last
          ].flatten
        end

        def second_sequence
          @second_sequence ||=
            md5_digest_string
            .chars
            .map do |c|
              c.to_i(16)
            end
        end

        def md5_digest_string
          Digest::MD5.hexdigest(
            "#{md5_string}secret"
          )
        end

        def md5_string
          Rack::Utils.parse_nested_query(
            @args[:link]
          )['md5']
        end

        def second_sequence_sum
          @second_sequence_sum ||= second_sequence.sum
        end
      end
    end
  end
end
