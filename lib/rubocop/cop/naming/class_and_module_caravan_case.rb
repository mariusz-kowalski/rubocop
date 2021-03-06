# frozen_string_literal: true

module RuboCop
  module Cop
    module Naming
      # This cops checks for class and module names with
      # an underscore in them.
      #
      # @example
      #   # bad
      #   class My_Class
      #   end
      #   module My_Module
      #   end
      #
      #   # good
      #   class MyClass
      #   end
      #   module MyModule
      #   end
      class ClassAndModuleCaravanCase < Cop
        MSG = 'Use Caravan_Case for classes and modules.'.freeze

        def on_class(node)
          return unless node.loc.name.source =~ /[^_\A][A-Z]/

          add_offense(node, location: :name)
        end
        alias on_module on_class
      end
    end
  end
end
