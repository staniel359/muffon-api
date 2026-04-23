module MusicBrainz
  module Formatter
    class Image < MusicBrainz::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          image_id
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
          "/#{@args[:image_id]}/front-#{size}"
      end
    end
  end
end
