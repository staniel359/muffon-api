module Bandcamp
  module Album
    class Info < Bandcamp::Album::Base
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
          title: title,
          artists: artists
        }
      end

      def artist_name
        artist['name']
      end

      def artist
        album['band']
      end

      def artist_bandcamp_id
        artist['band_id']
      end

      def album_extra_data
        {
          image: image_data,
          release_date:,
          description: description_truncated,
          tags: tags&.first(5),
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
          profile_id: @args[:profile_id]
        )
      end

      alias album response_data
    end
  end
end
