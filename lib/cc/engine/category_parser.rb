module CC
  module Engine
    class CategoryParser
      def initialize(cop_name)
        @cop_name = cop_name
      end

      def category
        CATEGORIES[cop_name] || CATEGORIES[namespace] || DEFAULT_CATEGORY
      end

      private

      DEFAULT_CATEGORY = "Style".freeze
      CATEGORIES = {
        "Lint" => "Style",
        "Lint/Eval" => "Security",
        "Metrics" => "Complexity",
        "Metrics/LineLength" => "Style",
        "Performance" => "Bug Risk",
        "Rails" => "Bug Risk",
        "Rails/ActionFilter" => "Style",
        "Rails/Delegate" => "Clarity",
        "Rails/HasAndBelongsToMany" => "Style",
        "Rails/TimeZone" => "Style",
        "Rails/Validation" => "Style",
        "Style" => "Style",
      }.freeze

      attr_reader :cop_name

      def namespace
        cop_name.split("/").first
      end
    end
  end
end
