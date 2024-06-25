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
        album.values_at(
          'release_year',
          'release_month',
          'release_day'
        ).compact
      end

      def description
        album['description']
      end

      def tags_list
        [
          raw_genres_list,
          raw_tags_list
        ].flatten.compact_blank
      end

      def raw_genres_list
        album['genre']
      end

      def raw_tags_list
        album['tags']&.split(
          /\s?"\s?/
        ) || []
      end

      def tracks_list
        album['tracks'].select do |t|
          t['title'].present?
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
