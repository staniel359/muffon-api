module Discogs
  module Group
    class Info < Discogs::Base
      private

      def primary_args
        [@args.group_id]
      end

      def data
        { group: group_data }
      end

      def group_data
        group_base_data.merge(group_extra_data)
      end

      def group_base_data
        {
          title: response_data['title'],
          artist: artist_name(response_data['artists']),
          source: 'discogs'
        }
      end

      def group_extra_data
        {
          images: images,
          released: response_data['year'].to_s,
          description: description,
          tracks: tracks
        }
      end

      def link
        "#{base_link}/masters/#{@args.group_id}"
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
