module BootstrapCostumes
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def create_initializer_file
        create_file "config/initializers/initializer.rb", "# Add initialization content here"
      end
    end
  end
end