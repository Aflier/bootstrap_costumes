module SuperTableFilter
  include ActiveSupport::Concern

  def set_filter(field, by)
    return if field.nil?

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

  def handle_radio(field, by, related)
    return if field.blank?

    if by == 'true'
      related.each do |filter|
        set_filter(filter, false)
      end
    end

    set_filter(field, by)
  end

  def filter_instance(filter_name, klass)
    return if filter(filter_name).nil?
    return klass.find_by(id: filter(filter_name).to_i) if klass.find_by(id: filter(filter_name).to_i)
  end
end