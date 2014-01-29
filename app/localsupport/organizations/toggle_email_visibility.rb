module Localsupport
  module Organizations
    class ToggleEmailVisibility

      def self.toggle(organization)
        new(organization).toggle
      end

      def initialize(organization)
        @organization = organization
      end

      def toggle
        organization.toggle_email_visibility
      end

      private
      attr_reader :organization

    end
  end
end
