FactoryGirl.define do
	factory :procurement_department, class: Organization::ProcurementDepartment do
		name "Untitled"
		cash 0
		inventory 0
    gender Organization::ProcurementDepartment::MEN
    garment_type ""
    garment_sub_type ""
		initialize_with { new(name, cash, inventory, gender, garment_type, garment_sub_type) }
	end
end