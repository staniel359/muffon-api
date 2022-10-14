module YandexMusic
  module Album
    class Info < YandexMusic::Album::Base
      private

      def album_data
        muffon_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        {
          source: source_data,
          title:,
          extra_title:,
          artist: artist_names_data,
          artists:
        }.compact
      end

      def album_extra_data
        {
          image: image_data,
          profiles_count:,
          release_date:,
          labels:,
          tags: tags_truncated,
          tracks:
        }.compact
      end

      def labels
        album['labels'].pluck(
          'name'
        ).uniq
      end

      def tags_list
        [album['genre']]
      end

      def tracks_list
        album['volumes'].flatten
      end

      def track_data_formatted(track)
        YandexMusic::Album::Info::Track.call(
          track:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
