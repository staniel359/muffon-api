module Google
  class Search
    class Result < Google::Search
      def call
        data
      end

      private

      def data
        {
          site_name: site_name,
          title: title,
          link: link,
          image: image_data,
          description: description
        }
      end

      def site_name
        opengraph_data('site_name')
      end

      def opengraph_data(name)
        @args.result.dig(
          'pagemap', 'metatags', 0, "og:#{name}"
        )
      end

      def title
        opengraph_data('title')
      end

      def link
        opengraph_data('url')
      end

      def image_data
        @args.result.dig(
          'pagemap', 'cse_image', 0, 'src'
        )
      end

      def description
        opengraph_data('description')
      end
    end
  end
end
