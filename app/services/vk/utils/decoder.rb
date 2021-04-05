module VK
  module Utils
    class Decoder < VK::Base
      VK_STR = 'abcdefghijklmnopqrstuvwxyz'\
        'ABCDEFGHIJKLMN0PQRSTUVWXYZO123456789+/='.freeze

      def call
        data
      end

      private

      def data
        return '' if no_data?

        decoded_link.sub(
          %r{(/\w+)(/audios)?(/\w+)(/index.m3u8)}, '\2\3.mp3'
        )
      end

      def no_data?
        @args.link.blank? || extra_strings.blank?
      end

      def extra_strings
        @extra_strings ||= @args.link.match(/extra=(.*)#(.*)/)
      end

      def decoded_link
        vk_s(extra_first, extra_second)
      end

      def extra_first
        vk_o(extra_strings[1])
      end

      def vk_o(string)
        index2 = i = 0
        string.chars.each_with_object([]) do |s, result|
          if div_four(index2)
            (i = sym_index(s) + (i << 6)) && (index2 += 1)
            result << chr(i, shift(index2))
          else
            (i = sym_index(s)) && (index2 += 1)
          end
        end.join
      end

      def div_four(num)
        num % 4 != 0
      end

      def sym_index(sym)
        VK_STR.index(sym)
      end

      def shift(index2)
        -2 * index2 & 6
      end

      def chr(char, shift)
        [(0xFF & (char >> shift)).chr]
      end

      def extra_second
        vk_o(extra_strings[2]).match(/\v(.*)/)[1].to_i ^ secrets.vk[:page_id]
      end

      def vk_s(first, second)
        l = first.length
        return first unless l.positive?

        o = vk_s_child(first, second)
        first = first.chars
        (1...l).each do |a|
          b = o[l - 1 - a]
          first[a], first[b] = first[b], first[a]
        end
        first.join
      end

      def vk_s_child(first, second)
        l = first.length
        return [] unless l.positive?

        o = []
        (l - 1).downto(0).each do |a|
          second = (l * (a + 1) ^ second + a) % l
          o.append(second)
        end
        o.reverse
      end
    end
  end
end
