module MusicBrainz
  module Search
    class Labels
      class Label < MusicBrainz::Search::Labels
        MODEL_NAME = 'label'.freeze

        include MusicBrainz::Utils::Artist

        def call
          data
        end

        private

        def data
          {
            source: source_data,
            name:
          }
        end

        def artist
          @args[:label]
        end
      end
    end
  end
end
