module LastFM
  module Tag
    class Description < LastFM::Tag::Base
      private

      def tag_data
        { description: description }
      end
    end
  end
end
