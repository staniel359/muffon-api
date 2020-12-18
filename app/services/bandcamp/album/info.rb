module Bandcamp
  module Album
    class Info < Bandcamp::Base
      private

      def primary_args
        [@args.album_link]
      end

      def no_data?
        album_info_data.blank?
      end

      def album_info_data
        @album_info_data ||=
          Bandcamp::Album::Info::Data.call(
            album_link: @args.album_link
          )[:album]
      end

      def data
        { album: album_data }
      end

      def album_data
        {
          title: title,
          artist: album_info_data['artist'],
          cover: cover,
          released: released,
          description: description,
          link: album_info_data['url'],
          tracks: tracks
        }
      end

      def title
        album_info_data.dig('current', 'title')
      end

      def cover
        "https://f4.bcbits.com/img/a#{album_art_id}_10.jpg"
      end

      def album_art_id
        album_info_data.dig('current', 'art_id')
      end

      def released
        return '' if release_date.blank?

        Time.zone.parse(release_date).strftime('%Y-%m-%d')
      end

      def release_date
        album_info_data.dig('current', 'release_date')
      end

      def description
        album_info_data.dig('current', 'about') || ''
      end

      def tracks
        album_info_data['trackinfo'].map do |t|
          {
            title: t['title'],
            length: t['duration'].ceil,
            link: t['title_link'],
            audio_link: t.dig('file', 'mp3-128').to_s
          }
        end
      end
    end
  end
end
