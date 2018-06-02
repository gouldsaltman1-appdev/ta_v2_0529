class Category < ApplicationRecord
  # Direct associations

  has_many   :pieces_of_equipment,
             :class_name => "Equipment",
             :dependent => :nullify

  # Indirect associations

  # Validations

end
