#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory, :category_attributes
	def initialize(name, cash, inventory, category_attributes = {})
		@name = name
		@cash = cash
		@inventory = inventory
    @category_attributes = category_attributes
	end

  def inventory_by_category(category_attr, value)
    return 0 unless category_attributes && category_attributes[category_attr] == value
    inventory
  end
end