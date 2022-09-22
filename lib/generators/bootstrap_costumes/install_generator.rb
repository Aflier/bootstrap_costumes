module BootstrapCostumes
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def create_initializer_file
        create_file "config/initializers/initializer.rb", "# Add initialization content here"
        copy_file File.expand_path("../../../../app/helpers/bootstrap_costumes/icons_helper.rb", __FILE__), "app/helpers/icons_helper.rb"
        copy_file File.expand_path("../../../../app/javascript/controllers/turbo_controller.js", __FILE__), "app/javascript/controllers/turbo_controller.js"
      end
    end
  end
end

# File.expand_path("config/initializers/initializer.rb", __FILE__)