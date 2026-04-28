module MusicBrainz
  module Search
    class Labels
      class Label < MusicBrainz::Search::Labels
        include MusicBrainz::Mixins::Label

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_label_data
          ]
        end

        def data
          Muffon::Formatter::Source::Search::Labels::Label.call(
            source_original_link:,
            source_name:,
            source_label_id: musicbrainz_id,
            name:,
            image_data: nil
          )
        end

        def raw_label_data
          @args[:raw_label_data]
        end
      end
    end
  end
end
