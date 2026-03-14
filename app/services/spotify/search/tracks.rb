module Spotify
  module Search
    class Tracks < Spotify::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count:
        )
      end

      def raw_collection
        response_data.dig(
          'data',
          'searchV2',
          'tracksV2',
          'items'
        )
      end

      def payload
        {
          'variables' => {
            'includePreReleases' => false,
            'numberOfTopResults' => 20,
            'searchTerm' => @args[:query],
            'offset' => offset,
            'limit' => limit,
            'includeAudiobooks' => true,
            'includeAuthors' => false
          },
          'operationName' => 'searchTracks',
          'extensions' => {
            'persistedQuery' => {
              'version' => 1,
              'sha256Hash' => '131fd38c13431be963a851082dca0108a4200998b886e7e9d20a21fc51a36aaf' # rubocop:disable Layout/LineLength
            }
          }
        }.to_json
      end

      def items_count
        response_data.dig(
          'data',
          'searchV2',
          'tracksV2',
          'totalCount'
        )
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        Spotify::Search::Tracks::Track.call(
          raw_track_data:,
          is_with_query_match: @args[:with_automatch],
          query_title: @args[:track_title],
          query_artist_name: @args[:artist_name],
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
