module Muffon
  module Radio
    module Tag
      class Tracks < Muffon::Radio::Tag::Base
        COLLECTION_NAME = 'tracks'.freeze

        private

        def no_track?
          tracks.blank?
        end

        def tracks
          @tracks ||= tag_data[:tracks]
        end

        def track
          random_track
        end
      end
    end
  end
end
