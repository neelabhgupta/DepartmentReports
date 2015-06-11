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
    it "should return inventory as 200 for a Procurement Department with 200 black products" do
      department1 = FactoryGirl.build(:procurement_department, inventory: 200, category_attributes: {"color" => "Black"})
      expect(department1.inventory_by_category({'color' => ['Black']})).to eq(200)
    end

    it "should return inventory as 0 for a Procurement Department with 200 green products" do
      department1 = FactoryGirl.build(:procurement_department, inventory: 200, category_attributes: {"color" => "Green"})
      expect(department1.inventory_by_category({'color' => ['Black']})).to eq(0)
    end

    it "should return inventory as 200 for a Procurement Department with 200 green products" do
      department1 = FactoryGirl.build(:procurement_department, inventory: 200, category_attributes: {"color" =>  "Green"})
      expect(department1.inventory_by_category({'color' => ['Green']})).to eq(200)
    end

    it "should return inventory as 200 for a Procurement Department with 200 black jeans" do
      department1 = FactoryGirl.build(:procurement_department, inventory: 200, category_attributes: {
        "color" =>  "Black", "garment_sub_type" => "Shirt"})
      expect(department1.inventory_by_category({'color' => ['Black']},{"garment_sub_type" => ["Jeans"]})).to eq(200)
    end

    it "should return inventory as 200 for a Procurement Department with 200 black shirt" do
      department1 = FactoryGirl.build(:procurement_department, inventory: 200, category_attributes: {
        "color" =>  "Black", "garment_sub_type" => "Shirt"})
      expect(department1.inventory_by_category({'color' => ['Black']},{"garment_sub_type" => ["Jeans"]})).to eq(200)
    end

    it "should return inventory as 200 for a Procurement Department with 200 red shirts" do
      department1 = FactoryGirl.build(:procurement_department, inventory: 200, category_attributes: {
        "color" =>  "Red", "garment_sub_type" => "Shirt"})
      expect(department1.inventory_by_category({'color' => ['Black', 'Red']},{"garment_sub_type" => ["Jeans"]})).to eq(200)
    end

    it "should return inventory as 200 for a Procurement Department with 200 red shirts" do
      department1 = FactoryGirl.build(:procurement_department, inventory: 200, category_attributes: {
        "color" =>  "Red"})
      expect(department1.inventory_by_category({'color' => ['Black', 'Red']},{"garment_sub_type" => ["Jeans"]})).to eq(0)
    end
  end

end