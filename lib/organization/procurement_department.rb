#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory, :category_attributes
	def initialize(name, cash, inventory, category_attributes = {})
		@name = name
		@cash = cash
		@inventory = inventory
    @category_attributes = category_attributes
	end

  def generate_report(report)
    report.build_report(self)
  end

  def color
    category_attributes["color"] if category_attributes
  end

  def inventory_for_black_clothes
    return inventory if category_attributes && category_attributes["color"] == "Black" && ["t-shirts", "jeans"].include?(category_attributes["garment_sub_type"])
    0
  end

  def inventory_for_underfunded_colors(color, cash_threshold)
    return inventory if (category_attributes && category_attributes["color"] == color ) && cash < cash_threshold
    0
  end

end