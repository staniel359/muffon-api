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
        results.last(limit).map do |r|
          {
            title: r['name'],
            artist: r['artist'],
            images: images(r)
          }
        end
      end

      def images(result)
        LastFM::Utils::Images.call(
          data: result, model: 'album'
        )
      end
    end
  end
end
