module Discogs
  module Artist
    class Albums < Discogs::Base
      private

      def primary_args
        [@args.artist_id]
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        {
          page: page,
          total_pages: total_pages,
          albums: albums
        }
      end

      def page
        response_data.dig('pagination', 'page')
      end

      def api_link
        "https://api.discogs.com/artists/#{@args.artist_id}/releases"
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
            image: a['thumb'],
            released: a['year'].to_s,
            id_key(a).to_sym => a['id']
          }
        end
      end

      def id_key(album)
        album['type'] == 'master' ? 'discogs_group_id' : 'discogs_id'
      end
    end
  end
end
