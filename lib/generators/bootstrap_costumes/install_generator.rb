module BootstrapCostumes
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def create_initializer_file
        create_file File.expand_path("../../../../config/initializers/initializer.rb", __FILE__), "# Add initialization content here"
      end
    end
  end
end