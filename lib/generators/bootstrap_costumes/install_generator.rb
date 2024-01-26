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

        template "models/concerns/super_table_filter.rb", "app/models/concerns/super_table_filter.rb"
        template "javascript/controllers/filter_controller.js", "app/javascript/controllers/filter_controller.js"
        template "javascript/controllers/filters_controller.js", "app/javascript/controllers/filters_controller.js"
        template "views/stimulus/filters/_filter_input.html.erb", "app/views/stimulus/filters/_filter_input.html.erb"
        template "views/stimulus/filters/_filter_number_input.html.erb", "app/views/stimulus/filters/_filter_number_input.html.erb"
        template "views/stimulus/filters/_filter_radio.html.erb", "app/views/stimulus/filters/_filter_radio.html.erb"
        template "views/stimulus/filters/_filter_toggle.html.erb", "app/views/stimulus/filters/_filter_toggle.html.erb"

        template "views/_tabbed_card.html.erb", "app/views/bootstrap_costumes/cards/_tabbed_card.html.erb"
        template "views/_tabbed_vertical_card.html.erb", "app/views/bootstrap_costumes/cards/_tabbed_vertical_card.html.erb"
        template "views/_vertical_tab_panel.html.erb", "app/views/bootstrap_costumes/cards/_vertical_tab_panel.html.erb"


        # copy_file File.expand_path("../../../../app/javascript/bootstrap_costumes/controllers/turbo_controller.js", __FILE__), "app/javascript/controllers/turbo_controller.js"
      end
    end
  end
end

# File.expand_path("config/initializers/initializer.rb", __FILE__)