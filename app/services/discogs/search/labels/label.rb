module Discogs
  module Search
    class Labels
      class Label < Discogs::Search::Labels
        MODEL_NAME = 'label'.freeze

        include Discogs::Utils::Artist

        def call
          data
        end

        private

        def data
          {
            source: source_data,
            name:,
            image: image_data
          }.compact
        end

        def artist
          @args[:label]
        end

        def image
          artist['cover_image']
        end
      end
    end
  end
end
