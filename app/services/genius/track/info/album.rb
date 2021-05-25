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
            title: title,
            genius_id: genius_id
          }
        end

        def album
          @album ||= @args.album
        end
      end
    end
  end
end
