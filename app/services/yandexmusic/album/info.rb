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
          source_id: SOURCE_ID,
          title:,
          extra_title:,
          artists:
        }.compact
      end

      def album_extra_data
        {
          image: image_data,
          release_date:,
          labels:,
          tags: tags&.first(5),
          tracks:
        }.compact
      end

      def labels_list
        album['labels']
      end

      def label_data_formatted(label)
        { name: label['name'] }
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
