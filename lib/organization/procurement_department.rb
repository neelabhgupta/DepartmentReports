#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory, :gender
  MEN = "Men"
  WOMEN = "Women"
	def initialize(name, cash, inventory, gender)
		@name = name
		@cash = cash
		@inventory = inventory
    @gender = gender
	end
end