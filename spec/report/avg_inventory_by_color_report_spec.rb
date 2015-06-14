require "spec_helper"

describe Report::AvgInventoryByColorReport do
  context 'average inventory for a given color in procurement department' do
    it "should return 200 inventory for black for a Procurement Department with 200 black products" do
      department1 = FactoryGirl.build(:procurement_department, inventory: 200, category_attributes: {"color" => "Black"})
      color_report = FactoryGirl.build(:avg_inventory_by_color_report, color: "Black")
      expect(color_report.build_report(department1)).to eq(200.0)
    end
  end
end