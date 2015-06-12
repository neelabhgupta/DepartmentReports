# Represents an administrative division in an organization
class Organization::ManagerialDepartment
	
	def initialize(department_name, sub_departments = [], category_attributes = {})
		@name = department_name
		@sub_departments = sub_departments
		@category_attributes = category_attributes
	end

	def cash
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.cash 
		end
	end

	def inventory
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory 
		end
	end

	def average_inventory
		inventory/@sub_departments.length
	end

  def generate_report(report)
  	@sub_departments.each do |dept|
  		dept.generate_report(report)
  	end
	end

	def inventory_for_black_clothes
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory_for_black_clothes
		end
	end

	def inventory_for_underfunded_colors(color, cash_threshold)
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory_for_underfunded_colors(color, cash_threshold)
		end
	end
end