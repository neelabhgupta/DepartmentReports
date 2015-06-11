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

  context 'catogerize' do
    it "should return gender as 'men' when initiated with men" do
      department1 = FactoryGirl.build(:procurement_department, gender: Organization::ProcurementDepartment::MEN)
      expect(department1.gender).to eq(Organization::ProcurementDepartment::MEN)
    end

    it "should return garment_type and garment_sub_type as 'shirt' and 'T-shirt' when initiated with shirt and t-shirt" do
      department1 = FactoryGirl.build(:procurement_department, garment_type: "shirt", 
        garment_sub_type: "T-shirt")
      expect([department1.garment_type ,department1.garment_sub_type ]).to eq(["shirt" ,"T-shirt"])
    end
  end
end