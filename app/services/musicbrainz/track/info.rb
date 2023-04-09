module MusicBrainz
  module Track
    class Info < MusicBrainz::Base
      include MusicBrainz::Utils::Track

      def call
        super
      rescue RestClient::BadRequest
        not_found
      end

      private

      def primary_args
        [@args[:track_id]]
      end

      def link
        "#{BASE_LINK}/recording/#{@args[:track_id]}"
      end

      def params
        super
          .merge(track_params)
      end

      def track_params
        { inc: 'artist-credits+tags+releases' }
      end

      def data
        { track: track_data }
      end

      def track_data
        track_base_data
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          source: source_data,
          player_id:,
          title:,
          artist: artist_names_data,
          artists:
        }
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          profiles_count:,
          release_date:,
          tags: tags_truncated
        }.compact_blank
      end

      def release_date
        date_formatted(
          track['first-release-date']
        )
      end

      def tags_list
        track['tags']
      end

      alias track response_data
    end
  end
end
