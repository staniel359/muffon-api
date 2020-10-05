module LastFM
  class Artist
    class Tracks < LastFM::Base
      def call
        return not_found_data if parsed_response.blank?

        { artist: tracks_data }
      end

      private

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('artist.getTopTracks')
        )['toptracks']
      end

      def tracks_data
        {
          name: parsed_response['@attr']['artist'],
          tracks: tracks,
          page: parsed_response['@attr']['page'].to_i
        }
      end

      def tracks
        parsed_response['track'].last(50).map do |t|
          {
            title: t['name'],
            mbid: t['mbid'],
            plays_count: t['playcount'].to_i,
            listeners_count: t['listeners'].to_i
          }
        end
      end
    end
  end
end
