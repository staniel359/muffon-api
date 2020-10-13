module LastFM
  module Search
    class Albums < LastFM::Search::Base
      private

      def model_params
        { album: @args.query }
      end

      def model_name
        'album'
      end

      def results_data
        results.map do |r|
          {
            title: r['name'],
            artist: r['artist'],
            cover: r['image'].last['#text'].sub('/300x300', '')
          }
        end
      end
    end
  end
end
