FactoryGirl.define do
	factory :managerial_department, class: Organization::ManagerialDepartment do
		name "Untitled"
		sub_departments []
    category_attributes {}    
		initialize_with { new(name, sub_departments, category_attributes) }
	end
end