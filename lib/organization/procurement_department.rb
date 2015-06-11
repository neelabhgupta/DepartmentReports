#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory, :category_attributes
	def initialize(name, cash, inventory, category_attributes)
		@name = name
		@cash = cash
		@inventory = inventory
    @category_attributes = category_attributes
	end

  def selective_inventory
    return 0 if category_attributes[:color] != "Black"
    inventory
  end
end