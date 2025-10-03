module LastFM
  module Album
    class Info < LastFM::Album::Base
      private

      def params
        super.merge(
          language_params
        )
      end

      def album_data
        return album_list_data if @args[:list]

        update_listeners_count

        album_full_data
      end

      def album_list_data
        self_data
          .merge(album_base_data)
          .merge(album_list_extra_data)
      end

      def update_listeners_count
        find_album.update!(
          listeners_count:
            album['listeners'].to_i
        )
      end

      def album_full_data
        self_data
          .merge(album_base_data)
          .merge(album_counters_data)
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
          listeners_count:
        }.compact
      end

      def album_counters_data
        {
          listeners_count:,
          plays_count:
            album['playcount'].to_i,
          profiles_count:
        }.compact
      end

      def album_extra_data
        {
          description:
            description_truncated,
          tags: tags_truncated,
          tracks:
        }.compact
      end

      def description_truncated
        text_truncated(
          description,
          size: 'medium'
        )
      end

      def description
        description_formatted(
          raw_description
        )
      end

      def raw_description
        album.dig(
          'wiki',
          'content'
        )
      end

      def tags_truncated
        collection_truncated(
          tags,
          size: 'extrasmall'
        )
      end

      def raw_tags
        album.dig(
          'tags',
          'tag'
        )
      end

      def raw_tracks
        album.dig(
          'tracks',
          'track'
        )
      end

      def track_data_formatted(track)
        LastFM::Album::Info::Track.call(
          track:,
          album_data: album_base_data,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
