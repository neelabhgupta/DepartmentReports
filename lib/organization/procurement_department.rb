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

  def inventory_by_conditions1
    return inventory if category_attributes && category_attributes["color"] == "Black" && ["t-shirts", "jeans"].include?(category_attributes["garment_sub_type"])
    0
  end
end