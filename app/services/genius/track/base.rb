module Genius
  module Track
    class Base < Genius::Base
      private

      def primary_args
        [@args.track_id]
      end

      def no_data?
        track.blank?
      end

      def track
        @track ||= response_data.dig('response', 'song')
      end

      def response_data
        JSON.parse(response)
      end

      def response
        RestClient.get(link)
      end

      def link
        "https://genius.com/api/songs/#{@args.track_id}"
      end

      def data
        { track: track_data }
      end

      def title
        track['title_with_featured']
      end

      def artist_data
        { name: artist_name }
      end

      def artist_name
        track['primary_artist']['name']
      end

      def description
        track['description_preview']
      end

      def tags_list
        track['tags']
      end

      def lyrics
        Genius::Track::Info::Lyrics.call(
          track_slug: track['path']
        )[:lyrics]
      end
    end
  end
end
