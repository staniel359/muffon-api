module Bandcamp
  module Album
    class Info < Muffon::Base
      def call
        return bad_request_error if not_all_args?
        return not_found_error if no_data?
        return retry_with_redirect_link if no_tracks?

        data
      rescue RestClient::NotFound, SocketError
        not_found_error
      end

      private

      def primary_args
        return [@args.link] if @args.link.present?

        [@args.artist, @args.album]
      end

      def no_data?
        link.blank? || album_script.blank?
      end

      def link
        @link ||= @args.link || retrieve_link
      end

      def retrieve_link
        Bandcamp::Album::Link.call(
          @args.to_h.slice(:artist, :album)
        )[:link]
      end

      def album_script
        @album_script ||=
          response_data.find { |s| album_script?(s) }
      end

      def response_data
        Nokogiri::HTML.parse(response).css('script')
      end

      def response
        RestClient.get(link)
      end

      def album_script?(script)
        script.attributes.keys.include?('data-tralbum')
      end

      def no_tracks?
        album_json['trackinfo'].blank?
      end

      def album_json
        @album_json ||=
          JSON.parse(album_script['data-tralbum'])
      end

      def retry_with_redirect_link
        self.class.name.constantize.call(
          link: description
        )
      end

      def description
        album_json.dig('current', 'about')
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
          description: description,
          tracks: tracks,
          link: album_json['url']
        }
      end

      def cover
        "https://f4.bcbits.com/img/a#{album_art_id}_10.jpg"
      end

      def album_art_id
        album_json.dig('current', 'art_id')
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
