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
          title: title,
          extra_title: extra_title,
          yandex_music_id: yandex_music_id,
          artist: artist_formatted,
          artists: artists,
          source_id: SOURCE_ID
        }.compact
      end

      def album_extra_data
        {
          image: image_data,
          release_date: release_date,
          labels: labels,
          tags: tags.first(5),
          tracks: tracks
        }
      end

      def labels
        labels_list.map do |l|
          label_data_formatted(l)
        end
      end

      def labels_list
        response_data['labels']
      end

      def label_data_formatted(label)
        { name: label['name'] }
      end

      def tags_list
        [album['genre']]
      end

      def tracks
        tracks_list.map do |t|
          track_data_formatted(t)
        end
      end

      def tracks_list
        response_data['volumes'].flatten
      end

      def track_data_formatted(track)
        YandexMusic::Album::Info::Track.call(
          track: track,
          profile_id: @args.profile_id
        )
      end
    end
  end
end
