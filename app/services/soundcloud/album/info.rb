module SoundCloud
  module Album
    class Info < SoundCloud::Album::Base
      private

      def album_data
        album_base_data
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        {
          library_id: library_id,
          title: title,
          soundcloud_id: soundcloud_id,
          artist: artist_formatted,
          artists: artists,
          source_id: SOURCE_ID
        }.compact
      end

      def album_extra_data
        {
          image: image_data,
          release_date: release_date,
          description: description_truncated,
          tags: tags.first(5),
          tracks: tracks
        }
      end

      def release_date
        date_formatted(raw_release_date)
      end

      def raw_release_date
        album.values_at(
          'release_year',
          'release_month',
          'release_day'
        ).compact
      end

      def description
        album['description'] || ''
      end

      def tags_list
        [
          raw_genres,
          raw_tags
        ].flatten.reject(&:blank?)
      end

      def raw_genres
        album['genre']
      end

      def raw_tags
        album['tags'].split(/\s?"\s?/)
      end

      def tracks
        tracks_list.map do |t|
          track_data_formatted(t)
        end
      end

      def tracks_list
        album['tracks']
      end

      def track_data_formatted(track)
        SoundCloud::Album::Info::Track.call(
          track: track,
          profile_id: @args.profile_id
        )
      end
    end
  end
end
