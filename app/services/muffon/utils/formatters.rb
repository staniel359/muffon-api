module Muffon
  module Utils
    module Formatters
      TEXT_SIZES_DATA = {
        'extrasmall' => 100,
        'small' => 200,
        'medium' => 400
      }.freeze
      COLLECTION_SIZES_DATA = {
        'extrasmall' => 5
      }.freeze

      include Muffon::Utils::Formatters::Collection

      private

      def artists_minimal_data
        { name: artists_names }
      end

      def artists_names
        artists
          .pluck(:name)
          .join(', ')
      end

      def artists_base_data
        {
          name: artists_names,
          image: artists_image_data
        }.compact
      end

      def artists_image_data
        find_artist.image_data
      end

      def date_formatted(
        data
      )
        Muffon::Utils::Date.call(
          data:
        )
      end

      def datetime_formatted(
        date
      )
        date.strftime('%F %T')
      end

      def duration_string_to_seconds(
        duration
      )
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

      def source_links_data
        {
          original: original_link,
          streaming: streaming_link
        }.compact
      end

      def streaming_link
        nil
      end

      def streaming_link_formatted(
        model:,
        model_id:
      )
        Muffon::Utils::StreamingLink.call(
          model:,
          source: source_name,
          model_id:
        )
      end

      def string_with_newlines_replaced_by_spaces(
        string
      )
        string&.gsub("\n", ' ')
      end
    end
  end
end
