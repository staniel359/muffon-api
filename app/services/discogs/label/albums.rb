module Discogs
  module Label
    class Albums < Discogs::Base
      private

      def primary_args
        [@args.label_id]
      end

      def data
        { label: label_data }
      end

      def label_data
        {
          page: page,
          total_pages: total_pages,
          albums: albums
        }
      end

      def page
        response_data.dig('pagination', 'page')
      end

      def link
        "#{base_link}/labels/#{@args.label_id}/releases"
      end

      def total_pages
        response_data.dig('pagination', 'pages')
      end

      def extra_params
        { page: @args.page, per_page: @args.limit }
      end

      def albums
        response_data['releases'].map do |a|
          {
            title: a['title'],
            artist: a['artist'],
            images: images(a['thumb'], 'album'),
            released: a['year'].to_s,
            discogs_id: a['id']
          }
        end
      end
    end
  end
end
