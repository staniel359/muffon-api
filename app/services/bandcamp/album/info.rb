module Bandcamp
  module Album
    class Info < Bandcamp::Album::Base
      ALBUM_TYPES = {
        a: 'album',
        t: 'track'
      }.freeze

      private

      def album_data
        return album_list_data if @args[:list]

        album_full_data
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
        {
          source: source_data,
          title:,
          artist: artists_minimal_data,
          artists:
        }
      end

      def bandcamp_id
        album['id']
      end

      def artist_bandcamp_id
        album.dig(
          'band', 'band_id'
        )
      end

      def artist_name
        album['tralbum_artist']
      end

      def bandcamp_model
        ALBUM_TYPES[
          album['type'].to_sym
        ]
      end

      def album_list_extra_data
        {
          image: image_data,
          release_date:,
          listeners_count:
        }.compact
      end

      def album_extra_data
        {
          image: image_data,
          profiles_count:,
          release_date:,
          description:
            description_truncated,
          tags: tags_truncated,
          tracks:
        }.compact
      end

      def description
        album['about']
      end

      def tags_list
        album['tags']
      end

      def tracks_list
        album['tracks']
      end

      def track_data_formatted(track)
        Bandcamp::Album::Info::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      alias album response_data
    end
  end
end
