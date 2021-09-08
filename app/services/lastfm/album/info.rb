module LastFM
  module Album
    class Info < LastFM::Album::Base
      private

      def params
        super.merge(lang_params)
      end

      def album_data
        muffon_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        {
          title: title,
          artist: artist_formatted,
          artists: artists,
          source_id: SOURCE_ID
        }
      end

      def album_extra_data
        {
          image: image_data,
          listeners_count: listeners_count,
          plays_count: plays_count,
          description: description_truncated,
          tags: tags,
          tracks: tracks
        }
      end

      def listeners_count
        album['listeners'].to_i
      end

      def plays_count
        album['playcount'].to_i
      end

      def description
        description_formatted(
          album.dig('wiki', 'content')
        )
      end

      def tags_list
        return [] if album['tags'].blank?

        [
          album.dig('tags', 'tag')
        ].flatten
      end

      def tracks
        tracks_list.map do |t|
          track_data_formatted(t)
        end
      end

      def tracks_list
        [
          album.dig('tracks', 'track')
        ].flatten.compact
      end

      def track_data_formatted(track)
        LastFM::Album::Info::Track.call(
          track: track,
          profile_id: @args.profile_id
        )
      end
    end
  end
end
