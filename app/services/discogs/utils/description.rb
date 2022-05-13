module Discogs
  module Utils
    class Description < Discogs::Base
      DESCRIPTION_RULES = [
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
        data
      end

      private

      def data
        description = @args[:description] || ''

        DESCRIPTION_RULES.each do |regexp, rule|
          description = description.gsub(
            regexp, rule
          )
        end

        description
      end
    end
  end
end
