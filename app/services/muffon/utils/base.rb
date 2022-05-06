module Muffon
  module Utils
    module Base
      SELF_PREFIXES = %w[
        library favorite bookmark listened
      ].freeze

      private

      def self_data(model)
        return {} if @args[:profile_id].blank?

        @self_data ||=
          raw_self_data(model).map do |a|
            { a['key'].to_sym => a['value'] }
          end.inject(:merge) || {}
      end

      def raw_self_data(model)
        ActiveRecord::Base
          .connection
          .execute(
            self_queries(model)
          )
          .to_a
      end

      def self_queries(model)
        SELF_PREFIXES.map do |prefix|
          format_self_query(
            model, "#{prefix}_#{model}"
          )
        end.join(' UNION ')
      end

      def format_self_query(model, scope)
        scope
          .camelize
          .constantize
          .where(
            profile_id: @args[:profile_id],
            "#{model}_id" => send("#{model}_id")
          )
          .select("id as value, '#{scope}_id' as key")
          .to_sql
      end
    end
  end
end
