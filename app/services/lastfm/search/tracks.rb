module LastFM
  module Search
    class Tracks < LastFM::Search::Base
      private

      def model_name
        'track'
      end

      def tracks
        parsed_response.dig('trackmatches', 'track').map do |t|
          {
            title: t['name'],
            artist: t['artist'],
            listeners_count: t['listeners'].to_i
          }
        end
      end
    end
  end
end
