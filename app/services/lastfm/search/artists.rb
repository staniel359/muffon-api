module LastFM
  module Search
    class Artists < LastFM::Web
      private

      def primary_args
        [@args.query]
      end

      def no_data?
        response_data.css('.artist-result').blank?
      end

      def link
        'https://www.last.fm/search/artists'
      end

      def params
        { q: @args.query }
      end

      def data
        { search: search_data }
      end

      def search_data
        { artists: artists_data }
      end

      def artists_data
        artists_list.map do |a|
          {
            name: name(a),
            image: image(a),
            listeners_count: listeners_count(a)
          }
        end
      end

      def artists_list
        response_data.css('.artist-result').first(limit)
      end

      def limit
        (@args.limit || 20).to_i
      end

      def name(artist)
        artist.css('.artist-result-heading a')[0]['title']
      end

      def image(artist)
        artist.css(
          '.artist-result-image img'
        )[0]['src'].sub('avatar70s', '64s')
      end

      def listeners_count(artist)
        artist.css(
          '.artist-result-listeners'
        ).text.scan(/\d+/).join.to_i
      end
    end
  end
end
