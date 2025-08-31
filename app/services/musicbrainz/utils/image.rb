module MusicBrainz
  module Utils
    class Image < MusicBrainz::Base
      def call
        return if args_missing?

        data
      end

      private

      def required_args
        %i[
          album_id
          album_type
        ]
      end

      def data
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
