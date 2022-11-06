module Muffon
  class Self < Muffon::Profile::Base
    SELF_PREFIXES = %w[
      library
      favorite
      bookmark
      listened
    ].freeze

    def call
      return {} if return?

      data
    end

    private

    def return?
      not_all_args? || no_data?
    end

    def primary_args
      [
        @args[:profile_id],
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
      SELF_PREFIXES.map do |prefix|
        format_self_query(
          prefix
        )
      end
    end

    def format_self_query(prefix)
      scope = "#{prefix}_#{model}"

      scope_model(
        scope
      ).where(
        profile_id: profile.id,
        "#{model}_id" => model_id
      ).select(
        "id as value, '#{scope}_id' as key"
      ).to_sql
    end

    def scope_model(scope)
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
