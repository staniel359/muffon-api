module LastFM
  module Artist
    class Similar < LastFM::Web
      private

      def primary_args
        [@args.artist]
      end

      def link
        "https://www.last.fm/music/#{artist_name}/+similar"
      end

      def artist_name
        CGI.escape(@args.artist.to_s)
      end

      def data
        { artist: similar_data }
      end

      def similar_data
        {
          name: name,
          page: page,
          total_pages: total_pages,
          similar: similar
        }
      end

      def name
        response_data.css('.header-new-title').text
      end

      def similar
        return [] if page > total_pages

        similar_list.map { |s| similar_artist_data(s) }
      end

      def similar_list
        response_data.css('.similar-artists-item')
      end

      def similar_artist_data(similar)
        LastFM::Artist::Similar::Artist.call(similar: similar)
      end
    end
  end
end
