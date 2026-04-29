module Discogs
  module Label
    class Info < Discogs::Label::Base
      include Discogs::Mixins::Label

      private

      def label_data
        Muffon::Formatter::Source::Label::Info.call(
          source_original_link:,
          source_name:,
          source_label_id: discogs_id,
          name:,
          image_data:,
          description:
        )
      end
    end
  end
end
