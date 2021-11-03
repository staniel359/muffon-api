module Genius
  module Track
    class Info
      class Album < Genius::Track::Info
        include Genius::Utils::Album

        def call
          data
        end

        private

        def data
          {
            source_id: SOURCE_ID,
            genius_id: genius_id,
            title: title
          }
        end

        def album
          @album ||= @args.album
        end
      end
    end
  end
end
