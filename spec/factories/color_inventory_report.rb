FactoryGirl.define do
  factory :color_inventory_report, class: Report::ColorInventoryReport do
    color nil  
    initialize_with { new(color) }
  end
end