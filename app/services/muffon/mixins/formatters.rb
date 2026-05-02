module Muffon
  module Mixins
    module Formatters
      TEXT_SIZES_DATA = {
        'extrasmall' => 100,
        'small' => 200,
        'medium' => 400
      }.freeze
      COLLECTION_SIZES_DATA = {
        'extrasmall' => 5
      }.freeze

      private

      def datetime_formatted(
        date
      )
        date.strftime('%F %T')
      end

      def duration_string_to_seconds(
        duration
      )
        return if duration.blank?

        duration
          .scan(/\d+/)
          .then do |minutes, seconds|
            (minutes.to_i * 60) + seconds.to_i
          end
      end

      def text_truncated(
        text,
        size:
      )
        text&.truncate(
          TEXT_SIZES_DATA[size]
        )
      end

      def collection_truncated(
        collection,
        size:
      )
        collection.first(
          COLLECTION_SIZES_DATA[size]
        )
      end

      def title_with_extra_title(
        title,
        extra_title: nil
      )
        if extra_title.present?
          "#{title} (#{extra_title})"
        else
          title
        end
      end

      def string_with_newlines_replaced_by_space(
        string
      )
        return if string.blank?

        string
          .gsub(/\n+/, ' ')
          .strip
      end

      def human_number_to_number(
        value
      )
        return if value.blank?

        miltipliers = {
          'K' => 3,
          'M' => 6,
          'B' => 9
        }

        _,
        count_string,
        multiplier_letter =
          value
          .match(
            /(\d+(?:[.|,]\d+)*)(\w)*/
          )
          .to_a

        count =
          count_string
          .gsub(',', '.')
          .to_f

        multiplier =
          miltipliers[multiplier_letter] || 0

        count *= 10 ** multiplier

        count.to_i
      end
    end
  end
end
