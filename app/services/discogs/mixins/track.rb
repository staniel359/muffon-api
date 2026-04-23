module Discogs
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_track_data['title']
      end

      def raw_artists
        (raw_track_data['artists'] || []).map do |raw_artist_data|
          raw_artist_data_formatted(
            raw_artist_data
          )
        end
      end

      def raw_artist_data_formatted(
        raw_artist_data
      )
        {
          name: artist_name_formatted(
            raw_artist_data['name']
          ),
          source_id: raw_artist_data['id']
        }.compact
      end

      def artist_name_formatted(name)
        name.split(
          / \(\d+\)$/
        )[0]
      end

      def duration
        return if raw_duration.blank?

        duration_string_to_seconds(
          raw_duration
        )
      end

      def raw_duration
        raw_track_data['duration']
      end

      def audio_present?
        false
      end

      def source_original_link
        nil
      end

      def discogs_id
        nil
      end
    end
  end
end
