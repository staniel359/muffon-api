module VK
  module Search
    class Tracks
      class Track < VK::Search::Tracks
        include VK::Mixins::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_track_data
          ]
        end

        def data
          Muffon::Formatter::Source::Search::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: vk_id,
            title:,
            artists:,
            album_title:,
            source_album_id: album_vk_id,
            source_album_owner_id: album_vk_owner_id,
            source_album_access_key: album_vk_access_key,
            image_data:,
            duration:,
            is_audio_present: audio_present?,
            **query_match_args,
            **self_args
          )
        end

        def raw_track_data
          @args[:raw_track_data]
        end
      end
    end
  end
end
