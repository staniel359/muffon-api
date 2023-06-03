module MusicBrainz
  module Search
    class Labels < MusicBrainz::Search::Base
      COLLECTION_NAME = 'labels'.freeze
      MODEL_NAME = 'label'.freeze

      private

      def collection_item_data_formatted(label)
        MusicBrainz::Search::Labels::Label.call(
          label:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
