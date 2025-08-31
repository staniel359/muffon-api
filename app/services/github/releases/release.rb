module GitHub
  class Releases
    class Release < GitHub::Releases
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          release
        ]
      end

      def data
        {
          version:,
          publish_date:,
          link:,
          description:
        }
      end

      def version
        release['name']
      end

      def release
        @args[:release]
      end

      def publish_date
        datetime_formatted(
          raw_publish_date
        )
      end

      def raw_publish_date
        release['published_at'].to_datetime
      end

      def link
        release['html_url']
      end

      def description
        release['body']
      end
    end
  end
end
