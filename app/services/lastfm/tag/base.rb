module LastFM
  module Tag
    class Base < LastFM::Web
      private

      def primary_args
        [@args.tag]
      end

      def link
        "https://www.last.fm/tag/#{tag_name}/#{collection}"
      end

      def tag_name
        format_param(@args.tag)
      end

      def collection
        @collection ||= self.class.name.demodulize.downcase
      end

      def data
        { tag: tag_data }
      end

      def tag_data
        {
          name: name,
          page: page,
          total_pages: total_pages,
          collection.to_sym => collection_data
        }
      end

      def name
        response_data.css('title').text.match(
          /Top (.+) #{collection}/
        )[1]
      end

      def collection_data
        page > total_pages ? [] : send(collection)
      end
    end
  end
end
