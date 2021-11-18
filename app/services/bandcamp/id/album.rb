module Bandcamp
  module Id
    class Album < Bandcamp::Id::Playlist::Base
      private

      def primary_args
        [
          @args[:artist],
          @args[:album]
        ]
      end

      def link
        "#{base_link}/album/#{@args[:album]}"
      end
    end
  end
end
