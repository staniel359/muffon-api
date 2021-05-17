module LastFM
  module Tag
    class Info < LastFM::Tag::API::Base
      private

      def tag_data
        tag_base_data
          .merge(tag_extra_data)
          .merge(with_more_data)
      end

      def tag_base_data
        { name: title }
      end

      def tag_extra_data
        {
          taggings_count: response_data['total'],
          taggers_count: response_data['reach'],
          description: description_truncated
        }
      end
    end
  end
end
