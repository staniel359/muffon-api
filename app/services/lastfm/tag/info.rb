module LastFM
  module Tag
    class Info < LastFM::Tag::Base
      private

      def tag_data
        tag_base_data
          .merge(with_more_data)
      end

      def tag_base_data
        {
          name: name,
          taggings_count: taggings_count,
          taggers_count: taggers_count,
          description: description_truncated
        }
      end

      def taggings_count
        tag['total']
      end

      def taggers_count
        tag['reach']
      end
    end
  end
end
