#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory, :category_attributes
	def initialize(name, cash, inventory, category_attributes = {})
		@name = name
		@cash = cash
		@inventory = inventory
    @category_attributes = category_attributes
	end

  def inventory_by_category(filter = {}, filter_negate = {} )
    return inventory if include_filter(filter) && exclude_filter(filter_negate)
    0  
  end

  def include_filter(filter)
    return true if filter.empty?
    return false unless category_attributes
    filter.each do |key, value|   
      return false if !value.include?(category_attributes[key])
    end
    true
  end

  def exclude_filter(filter)
    return true if filter.empty?
    return false unless category_attributes
    filter.each do |key, value|   
      return false if value.include?(category_attributes[key]) || !category_attributes[key]
    end
    true
  end
end