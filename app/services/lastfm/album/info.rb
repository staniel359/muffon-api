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
        update_listeners_count

        muffon_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def update_listeners_count
        find_album.update(
          listeners_count:
            album['listeners'].to_i
        )
      end

      def album_base_data
        {
          source_id:,
          title:,
          artist: artist_names_data,
          artists:
        }
      end

      def album_extra_data
        {
          image: image_data,
          listeners_count:,
          plays_count:
            album['playcount'].to_i,
          description:
            description_truncated,
          tags: tags_truncated,
          tracks:
        }.compact
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

        [raw_tags_list].flatten
      end

      def raw_tags_list
        album.dig(
          'tags', 'tag'
        )
      end

      def tracks_list
        [
          raw_tracks_list
        ].flatten.compact
      end

      def raw_tracks_list
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
