FactoryGirl.define do
	factory :procurement_department, class: Organization::ProcurementDepartment do
		name "Untitled"
		cash 0
		inventory 0
    category_attributes {}
		initialize_with { new(name, cash, inventory, category_attributes) }
	end
end