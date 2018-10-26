class SnackMachine < ApplicationRecord
  validates_presence_of :location

  belongs_to :snack
  belongs_to :machine 
end
