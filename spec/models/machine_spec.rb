require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end
  describe 'Relationships' do
    it { should have_many(:snack_machines) }
    it { should have_many(:snacks).through(:snack_machines)}
  end

  it 'can return averare price of snacks' do
    owner = Owner.create(name: "Sam's Snacks")
    machine_1 = owner.machines.create(location: "town")
    snack_1 = machine_1.snacks.create(name: "chips", price: 10)
    snack_2 = machine_1.snacks.create(name: "skittles", price: 8)

    average = machine_1.average_price

    expect(average).to eq(9.00)
  end

end
