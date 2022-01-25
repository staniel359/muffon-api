module LastFM
  module Album
    class Info < LastFM::Album::Base
      private

      def params
        super.merge(
          lang_params
        )
      end

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
          artists:
        }
      end

      def album_extra_data
        {
          image: image_data,
          listeners_count:,
          plays_count:,
          description: description_truncated,
          tags: tags&.first(5),
          tracks:
        }.compact
      end

      def listeners_count
        album['listeners'].to_i
      end

      def plays_count
        album['playcount'].to_i
      end

      def description
        description_formatted(
          raw_description
        )
      end

      def raw_description
        album.dig(
          'wiki', 'content'
        )
      end

      def tags_list
        return [] if album['tags'].blank?

        [raw_tags].flatten
      end

      def raw_tags
        album.dig(
          'tags', 'tag'
        )
      end

      def tracks_list
        [raw_tracks].flatten.compact
      end

      def raw_tracks
        album.dig(
          'tracks', 'track'
        )
      end

      def track_data_formatted(track)
        LastFM::Album::Info::Track.call(
          track:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
