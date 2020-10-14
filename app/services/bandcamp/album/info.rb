module Bandcamp
  module Album
    class Info < Bandcamp::Base
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
        links[position][:link] unless no_link?
      end

      def no_link?
        links.blank? || links[position].blank?
      end

      def links
        @links ||=
          Bandcamp::Album::Links.call(links_args)[:links]
      end

      def links_args
        @args.to_h.slice(:artist, :album)
      end

      def position
        @args.position.to_i
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
        raise RestClient::NotFound if redirect_link.blank?

        self.class.name.constantize.call(
          link: redirect_link
        )
      end

      def redirect_link
        @redirect_link ||= description[link_regexp]
      end

      def description
        album_json.dig('current', 'about')
      end

      def link_regexp
        %r{https?://\w+(?:-\w+)*.bandcamp.com/
          (?:album|track)/\w+(?:-\w+)*}x
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
          link: album_json['url'],
          tracks: tracks
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
