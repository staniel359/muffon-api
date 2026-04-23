module Discogs
  module Search
    class Labels
      class Label < Discogs::Search::Labels
        include Discogs::Mixins::Label

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
          Muffon::Formatter::Search::Labels::Label.call(
            source_original_link:,
            source_name:,
            source_label_id: discogs_id,
            name:,
            image_data:
          )
        end

        def raw_label_data
          @args[:raw_label_data]
        end

        def name
          raw_label_data['title']
        end

        def image_url
          raw_label_data['cover_image']
        end
      end
    end
  end
end
