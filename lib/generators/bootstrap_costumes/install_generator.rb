module BootstrapCostumes
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def create_initializer_file
        template "turbo_controller.js", "app/javascript/controllers/turbo_controller.js"
        template "modal_controller.js", "app/javascript/controllers/modal_controller.js"
        template "position_controller.js", "app/javascript/controllers/position_controller.js"
        template "position_control.rb", "app/controllers/concerns/position_control.rb"

        template "assets/stylesheets/layout.scss", "app/assets/stylesheets/layout.scss"

        template "model/concerns/super_table_filter.rb", "app/model/concerns/super_table_filter.rb"
        template "javascript/controller/filter_controller.js", "app/javascript/controller/filter_controller.js"
        template "views/stimulus/filters/_filter_input.html.erb", "app/views/stimulus/filters/_filter_input.html.erb"
        template "views/stimulus/filters/_filter_number_input.html.erb", "app/views/stimulus/filters/_filter_number_input.html.erb"
        template "views/stimulus/filters/_filter_radio.html.erb", "app/views/stimulus/filters/_filter_radio.html.erb"
        template "views/stimulus/filters/_filter_toggle.html.erb", "app/views/stimulus/filters/_filter_toggle.html.erb"

        # copy_file File.expand_path("../../../../app/javascript/bootstrap_costumes/controllers/turbo_controller.js", __FILE__), "app/javascript/controllers/turbo_controller.js"
      end
    end
  end
end

# File.expand_path("config/initializers/initializer.rb", __FILE__)