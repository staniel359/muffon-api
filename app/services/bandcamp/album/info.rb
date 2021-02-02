module Bandcamp
  module Album
    class Info < Bandcamp::Album::Base
      def call
        super { return handle_no_tracks if no_tracks? }
      end

      private

      def no_tracks?
        tracks_list.blank?
      end

      def handle_no_tracks
        return redirect if redirect_link.present?

        handlers.not_found
      end

      def redirect_link
        description[link_regexp]
      end

      def redirect
        self.class.name.constantize.call(link: redirect_link)
      end

      def data
        { album: album_data }
      end

      def album_data
        album_base_data.merge(album_extra_data)
      end

      def album_base_data
        {
          id: album_id(artist_name, title),
          title: title,
          artist: artist_data,
          source: 'bandcamp'
        }
      end

      def album_extra_data
        {
          images: images_data,
          released: released,
          link: base_data['@id'],
          description: description_truncated,
          tags: tags.first(5),
          tracks: tracks_data
        }
      end

      def released
        time_formatted(base_data['datePublished'])
      end

      def tracks_data
        tracks_list.map { |t| track_data(t) }
      end

      def track_data(track)
        {
          id: track_id(artist_name, track['title']),
          title: track['title'],
          artist: artist_data,
          length: track['duration'].floor,
          link: track_link(track),
          audio: audio_data(track)
        }
      end

      def track_link(track)
        base_data.dig('byArtist', '@id') + track['title_link']
      end

      def audio_data(track)
        {
          present: track['file'].present?,
          source: 'bandcamp'
        }
      end
    end
  end
end
