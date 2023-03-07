module Muffon
  class Self < Muffon::Profile::Base
    SELF_PREFIXES = {
      artist: %w[
        library favorite bookmark listened
      ],
      album: %w[
        library favorite bookmark listened
      ],
      track: %w[
        library favorite bookmark listened
      ],
      video: %w[
        favorite bookmark watched
      ],
      video_playlist: %w[
        bookmark
      ],
      video_channel: %w[
        bookmark
      ]
    }.freeze

    def call
      return {} if return?

      data
    end

    private

    def return?
      not_all_args? ||
        no_data? ||
        !valid_profile?
    end

    def primary_args
      [
        @args[:profile_id],
        @args[:token],
        @args[:model],
        @args[:model_id]
      ]
    end

    def data
      raw_self_data.to_h do |a|
        [
          a['key'].to_sym,
          a['value']
        ]
      end
    end

    def profile
      @profile ||=
        ::Profile
        .find_by(
          id: @args[:profile_id]
        )
    end

    def raw_self_data
      ActiveRecord::Base
        .connection
        .execute(
          self_query
        ).to_a
    end

    def self_query
      self_queries.join(
        ' UNION '
      )
    end

    def self_queries
      model_self_prefixes.map do |prefix|
        format_self_query(
          prefix
        )
      end
    end

    def model_self_prefixes
      SELF_PREFIXES[
        model.to_sym
      ]
    end

    def format_self_query(prefix)
      scope_model(
        prefix
      ).where(
        profile_id: profile.id,
        "#{model}_id" => model_id
      ).select(
        "id as value, '#{prefix}_id' as key"
      ).to_sql
    end

    def scope_model(prefix)
      scope = "#{prefix}_#{model}"

      scope
        .camelize
        .constantize
    end

    def model
      @args[:model]
    end

    def model_id
      @args[:model_id]
    end
  end
end
