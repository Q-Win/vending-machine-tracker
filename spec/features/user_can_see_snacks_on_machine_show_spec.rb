require 'rails_helper'

feature "When a user visits the vending machine show" do
  scenario "they see a list of all snacks and the average price" do
    owner = Owner.create(name: "Sam's Snacks")
    machine_1 = owner.machines.create(location: "town")
    snack_1 = machine_1.snacks.create(name: "chips", price: 4)
    snack_2 = machine_1.snacks.create(name: "skittles", price: 3)
    snack_3 = machine_1.snacks.create(name: "apple", price: 1)

    visit machine_path(machine_1)

    expect(page).to have_content("apple")
    expect(page).to have_content("skittles")
    expect(page).to have_content("chips")
    expect(page).to have_content(machine_1.average_price)
  end
end
