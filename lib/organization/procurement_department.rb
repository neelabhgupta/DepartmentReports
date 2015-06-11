#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory, :gender, :garment_type, :garment_sub_type
  MEN = "Men"
  WOMEN = "Women"
	def initialize(name, cash, inventory, gender, garment_type, garment_sub_type)
		@name = name
		@cash = cash
		@inventory = inventory
    @gender = gender
    @garment_type = garment_type
    @garment_sub_type = garment_sub_type
	end
end