module Bandcamp
  module Album
    class Info < Muffon::Base
      def call
        return bad_request_error if not_all_args?
        return not_found_error if wrong_link?
        return retry_with_redirect_link if no_tracks?

        data
      rescue RestClient::NotFound, SocketError
        not_found_error
      end

      private

      def primary_args
        [@args.link]
      end

      def wrong_link?
        album_script.blank?
      end

      def no_tracks?
        album_json['trackinfo'].blank?
      end

      def album_script
        @album_script ||= parsed_response.css('script').find do |s|
          s.attributes.keys.include?('data-tralbum')
        end
      end

      def parsed_response
        Nokogiri::HTML.parse(RestClient.get(@args.link))
      end

      def album_json
        @album_json ||= JSON.parse(
          album_script['data-tralbum']
        )
      end

      def retry_with_redirect_link
        self.class.name.constantize.call(
          link: album_json.dig('current', 'about')
        )
      end

      def data
        { album: album_data }
      end

      def album_data
        {
          title: album_json.dig('current', 'title'),
          artist: album_json['artist'],
          cover: cover,
          release_date: release_date_formatted,
          description: album_json.dig('current', 'about'),
          tracks: tracks,
          link: album_json['url']
        }
      end

      def cover
        'https://f4.bcbits.com/img/'\
          "a#{album_json.dig('current', 'art_id')}_10.jpg"
      end

      def release_date_formatted
        return if release_date.blank?

        Time.zone.parse(release_date).strftime('%Y-%m-%d')
      end

      def release_date
        album_json.dig('current', 'release_date')
      end

      def tracks
        album_json['trackinfo'].map do |t|
          {
            title: t['title'],
            length: t['duration'].ceil,
            link: t['title_link'],
            audio_link: t.dig('file', 'mp3-128')
          }
        end
      end
    end
  end
end
