module Discogs
  module Album
    class Info < Discogs::Base
      private

      def primary_args
        [@args.album_id]
      end

      def data
        { album: album_data }
      end

      def album_data
        album_base_data.merge(album_extra_data)
      end

      def album_base_data
        {
          title: response_data['title'],
          artist: artist_name(response_data['artists']),
          source: 'discogs'
        }
      end

      def album_extra_data
        {
          images: images,
          released: response_data['released_formatted'].to_s,
          description: description,
          labels: labels,
          tags: tags,
          tracks: tracks
        }
      end

      def link
        "#{base_link}/releases/#{@args.album_id}"
      end

      def labels
        response_data['labels'].map { |l| l['name'] }.uniq
      end

      def tags
        response_data.values_at('genres', 'styles').flatten.uniq
      end

      def tracks
        tracks_filtered.map { |t| track_data(t) }
      end

      def track_data(track)
        {
          id: track_id(track),
          title: track['title'],
          artist: (track_artist_name(track) if track['artists']),
          length: length_formatted(track['duration'])
        }.compact
      end
    end
  end
end
