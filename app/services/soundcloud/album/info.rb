module SoundCloud
  module Album
    class Info < SoundCloud::Album::Base
      private

      def album_data
        self_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        @album_base_data ||= {
          source: source_data,
          title:,
          artist: artists_minimal_data,
          artists:,
          image: image_data
        }.compact
      end

      def album_extra_data
        {
          profiles_count:,
          release_date:,
          description:
            description_truncated,
          tags: tags_truncated,
          tracks:
        }.compact
      end

      def release_date
        date_formatted(
          raw_release_date
        )
      end

      def raw_release_date
        album
          .values_at(
            'release_year',
            'release_month',
            'release_day'
          )
          .compact
      end

      def description_truncated
        text_truncated(
          description,
          size: 'medium'
        )
      end

      def description
        album['description'].presence
      end

      def tags_truncated
        collection_truncated(
          tags,
          size: 'extrasmall'
        )
      end

      def raw_tags
        [
          *album['genre'],
          *album['tags']&.split(/\s?"\s?/)
        ]
          .compact_blank
      end

      def raw_tracks
        album['tracks'].select do |raw_track_data|
          raw_track_data['title'].present?
        end
      end

      def track_data_formatted(track)
        SoundCloud::Album::Info::Track.call(
          track:,
          album_data: album_base_data,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
