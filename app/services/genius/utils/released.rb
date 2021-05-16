module Genius
  module Utils
    class Released < Genius::Base
      def call
        data
      end

      private

      def data
        return '' if released.blank?

        date_formatted(
          released.values.compact,
          released_format
        )
      end

      def released
        @released ||=
          @args.data['release_date_components']
      end

      def released_format
        [
          ('%d' if released['day'].present?),
          ('%b' if released['month'].present?),
          '%Y'
        ].compact.join(' ')
      end
    end
  end
end
