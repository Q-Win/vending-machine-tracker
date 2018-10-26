require 'rails_helper'

feature "When a user visits the snack show" do
  scenario "they see the snack name and price" do
    owner = Owner.create(name: "Sam's Snacks")
    machine_1 = owner.machines.create(location: "Denver")
    machine_2 = owner.machines.create(location: "FoCo")
    snack_1 = machine_1.snacks.create(name: "chips", price: 4)
    snack_2 = machine_1.snacks.create(name: "skittles", price: 3)
    snack_3 = machine_1.snacks.create(name: "apple", price: 1)
    machinesnack_2 = SnackMachine.create(snack: snack_2, machine: machine_2)

    visit snack_path(snack_2)

    expect(page).to have_content("skittles")
    expect(page).to have_content("3")
    expect(page).to have_content("Denver")
    expect(page).to have_content("FoCo")

  end
end
