require "spec_helper"

describe Report::ColorInventoryReport do
  context 'color inventory for procurement department' do
    it "should return 200 inventory for black for a Procurement Department with 200 black products" do
      department1 = FactoryGirl.build(:procurement_department, inventory: 200, category_attributes: {"color" => "Black"})
      color_report = FactoryGirl.build(:color_inventory_report, color: "Black")
      expect(color_report.build_report(department1)).to eq(200)
    end
  end
end