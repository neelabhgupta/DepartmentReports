require "spec_helper"

describe Organization::ProcurementDepartment do
  context 'cash' do
  	it "should return cash  as 200 for a Procurement Department having funds as 200" do
  		department1 = FactoryGirl.build(:procurement_department, cash: 200)
  		expect(department1.cash).to eq(200)
  	end
  end

  context 'inventory' do
  	it "should return inventory  as 200 for a Procurement Department initialized with 200 products" do
      department1 = FactoryGirl.build(:procurement_department, inventory: 200)
      expect(department1.inventory).to eq(200)
  	end
  end

  context 'category stats' do
    it "should return 200 inventory for black for a Procurement Department with 200 black products" do
      department1 = FactoryGirl.build(:procurement_department, inventory: 200, category_attributes: {"color" => "Black"})
      expect(department1.inventory_by_category('color', 'Black')).to eq(200)
    end

    it "should return 0 inventory for black for a Procurement Department with 200 green products" do
      department1 = FactoryGirl.build(:procurement_department, inventory: 200, category_attributes: {"color" => "Green"})
      expect(department1.inventory_by_category('color', 'Black')).to eq(0)
    end

    it "should return 200 inventory for green for a Procurement Department with 200 green products" do
      department1 = FactoryGirl.build(:procurement_department, inventory: 200, category_attributes: {"color" =>  "Green"})
      expect(department1.inventory_by_category('color', 'Green')).to eq(200)
    end

    it "should return 0 inventory for black clothes which have funding less that 100" do
      department = FactoryGirl.build(:procurement_department, inventory: 300, category_attributes: {"color" => "Yellow"}, cash: 230)
      expect(department.inventory_for_underfunded_colors('Black', 100)).to eq(0)
    end

    it "should return 20 inventory for Orange clothes which have funding less that 90" do
      department = FactoryGirl.build(:procurement_department, inventory: 20, category_attributes: {"color" => "Orange"}, cash: 30)
      expect(department.inventory_for_underfunded_colors('Orange', 90)).to eq(20)
    end
  end

end