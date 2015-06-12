#Gives the average inventory of a color in any department
class Report::AvgInventoryByColorReport
attr_reader :color, :inventory, :count, :avg_inventory

  def initialize(color)
    @color = color
    @inventory = 0.0
    @count = 0.0
    @avg_inventory = 0.0
  end

  def build_report(department)
    return 0 unless department.color == color
    @inventory = @inventory + department.inventory
    @count = @count + 1.0
    puts @inventory
    puts @count
    @avg_inventory =  @inventory / @count
  end
end
