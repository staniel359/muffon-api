module Genius
  module Utils
    class ReleaseDate < Genius::Base
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
          ('%d' if day_present?),
          ('%b' if month_present?),
          '%Y'
        ].compact.join(' ')
      end

      def day_present?
        released['day'].present?
      end

      def month_present?
        released['month'].present?
      end
    end
  end
end
