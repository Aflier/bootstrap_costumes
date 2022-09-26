module BootstrapCostumes
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def create_initializer_file
        copy_file File.expand_path("../../../../app/javascript/bootstrap_costumes/controllers/turbo_controller.js", __FILE__), "app/javascript/controllers/turbo_controller.js"
      end
    end
  end
end

# File.expand_path("config/initializers/initializer.rb", __FILE__)