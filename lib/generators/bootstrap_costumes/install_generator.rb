module BootstrapCostumes
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def create_initializer_file
        create_file "config/initializers/initializer.rb", "# Add initialization content here"
        copy_file "app/helpers/icons__helper.rb", File.expand_path("../../../../app/helpers/icons__helper.rb", __FILE__)
      end
    end
  end
end

# File.expand_path("config/initializers/initializer.rb", __FILE__)