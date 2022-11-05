module BootstrapCostumes
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def create_initializer_file
        template "turbo_controller.js", "app/javascript/controllers/turbo_controller.js"
        template "modal_controller.js", "app/javascript/controllers/modal_controller.js"
        template "position_controller.js", "app/javascript/controllers/position_controller.js"

        # copy_file File.expand_path("../../../../app/javascript/bootstrap_costumes/controllers/turbo_controller.js", __FILE__), "app/javascript/controllers/turbo_controller.js"
      end
    end
  end
end

# File.expand_path("config/initializers/initializer.rb", __FILE__)