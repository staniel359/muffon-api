module Spotify
  module Utils
    module Audio
      class Link
        class File < Spotify::Utils::Audio::Link
          # FORMAT = 'MP4_128'.freeze # Widevine
          FORMAT = 'OGG_VORBIS_160'.freeze # PlayPlay

          private

          def primary_args
            [@args[:track_data]]
          end

          def no_data?
            file_id.blank?
          end

          def file_id
            @file_id ||=
              matched_file.try(
                :[], 'file_id'
              )
          end

          def matched_file
            files.find do |f|
              matched_file?(f)
            end
          end

          def files
            file_group.try(
              :[], 'file'
            ) || []
          end

          def file_group
            file_groups_formatted.find do |g|
              matched_file_group?(g)
            end
          end

          def file_groups_formatted
            file_groups.map do |g|
              format_file_group_data(g)
            end
          end

          def file_groups
            [
              track_data,
              *alternative_file_groups
            ]
          end

          def track_data
            @args[:track_data]
          end

          def alternative_file_groups
            track_data['alternative'] || []
          end

          def format_file_group_data(file_group)
            file_group.slice(
              'file',
              'restriction'
            )
          end

          def matched_file_group?(file_group)
            Spotify::Utils::Audio::Link::File::GroupMatcher.call(
              file_group:
            )
          end

          def matched_file?(file)
            file['format'] == FORMAT
          end

          def link
            "#{BASE_LINK}/storage-resolve/files" \
              "/audio/interactive/#{file_id}"
          end

          alias data response_data
        end
      end
    end
  end
end
