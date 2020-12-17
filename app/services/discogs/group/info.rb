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
        {
          title: response_data['title'],
          artists: artists,
          image: image,
          released: response_data['year'].to_s,
          description: response_data['notes'].to_s,
          discogs_main_album_id: response_data['main_release'],
          tracks: tracks
        }
      end

      def api_link
        "https://api.discogs.com/masters/#{@args.group_id}"
      end

      def artists
        response_data['artists'].map do |a|
          {
            name: a['name'],
            discogs_id: a['id']
          }
        end
      end

      def tracks
        Discogs::Tracks.call(tracks: response_data['tracklist'])
      end
    end
  end
end
