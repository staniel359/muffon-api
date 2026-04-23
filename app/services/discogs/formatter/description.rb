module Discogs
  module Formatter
    class Description < Discogs::Base
      RULES = [
        [
          /\[a=(.*?)\]/,
          '\1'
        ],
        [
          /\[m=(.*?)\]/,
          'https://www.discogs.com/master/\1'
        ],
        [
          /\[l(.*?)\]/,
          'https://www.discogs.com/label/\1'
        ],
        [
          %r{\[url=(.*?)\].*\[/url\]},
          '\1'
        ]
      ].freeze

      def call
        return if description.blank?

        data
      end

      private

      def description
        @args[:description]
      end

      def data
        RULES.each do |regexp, rule|
          description.gsub!(regexp, rule)
        end

        description
      end
    end
  end
end
