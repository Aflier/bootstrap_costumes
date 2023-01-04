module SuperTableFilter
  include ActiveSupport::Concern

  def set_filter(field, by)
    by = false if by == 'false'
    by = true if by == 'true'
    self.filters_store[field.to_s] = by
    self.save!
  rescue
    self.filters_store = {}
    self.save!
  end

  def filter(field)
    filters_store[field.to_s]
  end
end