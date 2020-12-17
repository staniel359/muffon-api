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
        {
          title: response_data['title'],
          artists: artists, image: image,
          released: response_data['released_formatted'],
          format: format,
          description: response_data['notes'].to_s,
          discogs_group_id: response_data['master_id'],
          labels: labels, tracks: tracks
        }
      end

      def api_link
        "https://api.discogs.com/releases/#{@args.album_id}"
      end

      def artists
        response_data['artists'].map do |a|
          {
            name: a['name'],
            discogs_id: a['id']
          }
        end
      end

      def labels
        response_data['labels'].map do |l|
          {
            name: l['name'],
            discogs_id: l['id']
          }
        end.uniq
      end

      def format
        response_data['formats'].map do |l|
          l['descriptions']
        end.flatten.uniq.join(', ')
      end

      def tracks
        Discogs::Tracks.call(tracks: response_data['tracklist'])
      end
    end
  end
end
