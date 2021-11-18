module Bandcamp
  module Id
    class Track < Bandcamp::Id::Playlist::Base
      private

      def primary_args
        [
          @args[:artist],
          @args[:track]
        ]
      end

      def link
        "#{base_link}/track/#{@args[:track]}"
      end
    end
  end
end
