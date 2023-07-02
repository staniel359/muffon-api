module Muffon
  module Utils
    module Formatters
      include Muffon::Utils::Formatters::Collection

      private

      def artists_minimal_data
        { name: artists_names }
      end

      def artists_names
        artists.pluck(
          :name
        ).join(
          ', '
        )
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

      def date_formatted(data)
        Muffon::Utils::Date.call(
          data:
        )
      end

      def datetime_formatted(date)
        date.strftime('%F %T')
      end

      def duration_formatted(duration)
        duration
          .split(':')
          .map(&:to_i)
          .inject(0) do |a, b|
            (a * 60) + b
          end
      end

      def description_truncated
        description&.truncate(400).presence
      end

      def description_truncated_small
        description&.truncate(100).presence
      end

      def title_formatted(raw_title, extra_title)
        return raw_title if extra_title.blank?

        "#{raw_title} (#{extra_title})"
      end

      def source_links
        {
          original: original_link,
          streaming: streaming_link
        }.compact
      end

      def streaming_link
        nil
      end

      def streaming_link_formatted(model, model_id)
        Muffon::Utils::StreamingLink.call(
          model:,
          source: source_name,
          model_id:
        )
      end
    end
  end
end
