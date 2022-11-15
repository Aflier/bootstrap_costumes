module PositionControl
  extend ActiveSupport::Concern

  def position
    instance = GlobalID::Locator.locate_signed(params[:sgid])
    instance.insert_at(params[:position])
  end
end
