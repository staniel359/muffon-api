module MusicBrainz
  module Album
    class Info < MusicBrainz::Album::Base
      private

      def album_data
        if @args[:list]
          album_list_data
        else
          album_full_data
        end
      end

      def album_list_data
        self_data
          .merge(album_base_data)
          .merge(album_list_extra_data)
      end

      def album_full_data
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

      def album_list_extra_data
        {
          release_date:,
          listeners_count:
        }.compact
      end

      def album_extra_data
        {
          listeners_count:,
          release_date:,
          labels:,
          tags: tags_truncated,
          tracks:
        }.compact_blank
      end

      def raw_labels
        album['label-info']
      end

      def label_data_formatted(
        raw_label_data
      )
        raw_label_data.dig(
          'label',
          'name'
        )
      end

      def tags_truncated
        collection_truncated(
          tags,
          size: 'extrasmall'
        )
      end

      def track_data_formatted(track)
        MusicBrainz::Album::Info::Track.call(
          track:,
          album_data: album_base_data,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      alias album response_data
    end
  end
end
