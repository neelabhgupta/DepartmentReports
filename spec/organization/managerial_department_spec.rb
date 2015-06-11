require "spec_helper"

describe Organization::ManagerialDepartment do
 
  context 'Get total funds' do
  	it "should return total funds of a Department as a sum of funds in each of it's sub departments" do

  		sub_department1 = FactoryGirl.build(:procurement_department, cash: 10000)
  		sub_department2 = FactoryGirl.build(:procurement_department, cash: 10000)
  		sub_department3 = FactoryGirl.build(:procurement_department, cash: 10000)
  		department = FactoryGirl.build(:managerial_department, sub_departments:  [sub_department1, sub_department2, sub_department3])
  		expect(department.cash).to eq(30000.0)
  	end	

  	it "should return total funds of a Department as a sum of funds in each of it's sub departments" do
  		sub_department1 = FactoryGirl.build(:procurement_department, cash: 10000)
  		sub_department2 = FactoryGirl.build(:procurement_department, cash: 10000)
  		sub_department3 = FactoryGirl.build(:procurement_department, cash: 10000)
  		department1 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2])
  		department2 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department3, department1])
  		expect(department2.cash).to eq(30000.0)
  	end	
  end   

  context 'Inventory' do
    it "should return remaining inventory of a Department as a sum of inventory in each of it's sub departments" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 200)
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 200)
      sub_department3 = FactoryGirl.build(:procurement_department, inventory: 200)
      department = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2, sub_department3])
      expect(department.inventory).to eq(600)
    end 

    it "should return total remaining inventory of a Department as a sum of inventory in each of it's sub departments" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 300)
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 300)
      sub_department3 = FactoryGirl.build(:procurement_department, inventory: 300)
      department1 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2])
      department2 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department3, department1])
      expect(department2.inventory).to eq(900)
    end 
  end  

  context 'average sub inventory' do
    it "should return average inventory of the imediate sub-departments for a department" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 300)
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 300)
      sub_department3 = FactoryGirl.build(:procurement_department, inventory: 300)
      department1 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2])
      department2 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department3, department1])
      expect(department2.average_inventory).to eq(450)
    end
  end

  context 'inventory for clothes of a particular color' do
    it "should return inventory for black clothes for a department" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 300, category_attributes: {"color" => "Black"})
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 300, category_attributes: {"color" => "Green"})
      sub_department3 = FactoryGirl.build(:procurement_department, inventory: 300)
      department1 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2])
      department2 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department3, department1])
      expect(department2.inventory_by_category("color", "Black")).to eq(300)
    end

    it "should return inventory for yellow clothes for a department" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 300, category_attributes: {"color" => "Yellow"})
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 300, category_attributes: {"color" => "Green"})
      sub_department3 = FactoryGirl.build(:procurement_department, inventory: 300)
      department1 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2])
      department2 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department3, department1])
      expect(department2.inventory_by_category("color", "Yellow")).to eq(300)
    end
  end

  context "another report" do
    it "inventory for black clothes which are not t-shirts or jeans" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 300, category_attributes: {"color" => "Yellow"})
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 300, category_attributes: {"color" => "Black", "garment_sub_type" => "t-shirts"})
      sub_department3 = FactoryGirl.build(:procurement_department, inventory: 300)
      department1 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2])
      department2 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department3, department1])
      expect(department2.inventory_by_conditions1()).to eq(300)
    end
  end 
end