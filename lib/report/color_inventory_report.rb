#Gives inventory for a particular category
class Report::ColorInventoryReport
  attr_reader :color, :inventory

  def initialize(color)
    @color = color
    @inventory = 0
  end

  def build_report(department)
    return 0 unless department.category_attributes && department.category_attributes["color"] == color
    @inventory = @inventory + department.inventory
  end

end