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
          raw_release_data
        ]
      end

      def data
        {
          version:,
          publish_date: creation_date,
          link:,
          description:
        }
      end

      def version
        raw_release_data['name']
      end

      def raw_release_data
        @args[:raw_release_data]
      end

      def creation_date
        datetime_formatted(
          raw_creation_date
        )
      end

      def raw_creation_date
        raw_release_data['published_at'].to_datetime
      end

      def link
        raw_release_data['html_url']
      end

      def description
        raw_release_data['body']
      end
    end
  end
end
