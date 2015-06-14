FactoryGirl.define do
  factory :avg_inventory_by_color_report, class: Report::AvgInventoryByColorReport do
    color nil  
    initialize_with { new(color) }
  end
end