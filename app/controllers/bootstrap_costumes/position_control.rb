module BootstrapCostumes
  module PositionControl
    extend ActiveSupport::Concern

    def position
      @user_state = GlobalID::Locator.locate_signed(params[:sgid])
      @user_state.insert_at(params[:position])
    end
  end
end