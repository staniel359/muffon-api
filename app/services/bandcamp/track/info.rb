module Bandcamp
  module Track
    class Info < Bandcamp::Base
      private

      def primary_args
        [@args.track_link]
      end

      def no_data?
        track_scripts.blank?
      end

      def track_scripts
        @track_scripts ||= response_data.css('script')
      end

      def data
        { track: track_data }
      end

      def track_data
        {
          title: track_info_data['name'],
          artist: track_info_data.dig('byArtist', 'name'),
          album: track_info_data.dig('inAlbum', 'name'),
          images: images,
          length: track_info_data['duration_secs'].floor,
          audio_link: album_info_data.dig(
            'trackinfo', 0, 'file', 'mp3-128'
          )
        }
      end

      def track_info_data
        @track_info_data ||= JSON.parse(track_scripts[0])
      end

      def images
        {
          original: image,
          large: image.sub('_10', '_5'),
          medium: image.sub('_10', '_4'),
          small: image.sub('_10', '_3')
        }
      end

      def image
        "https://f4.bcbits.com/img/a#{album_info_data['art_id']}_10.jpg"
      end

      def album_info_data
        @album_info_data ||= JSON.parse(
          track_scripts[3]['data-tralbum']
        )
      end
    end
  end
end
