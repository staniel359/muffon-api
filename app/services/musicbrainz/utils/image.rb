module MusicBrainz
  module Utils
    class Image < MusicBrainz::Base
      def call
        data
      end

      private

      def data
        return if not_all_args?

        image_data
      end

      def primary_args
        [
          @args[:album_id],
          @args[:album_type]
        ]
      end

      def image_data
        {
          original: image_resized('1200'),
          large: image_resized('500'),
          medium: image_resized('500'),
          small: image_resized('250'),
          extrasmall: image_resized('250')
        }
      end

      def image_resized(size)
        'https://coverartarchive.org' \
          "/#{@args[:album_type]}" \
          "/#{@args[:album_id]}/front-#{size}"
      end
    end
  end
end
