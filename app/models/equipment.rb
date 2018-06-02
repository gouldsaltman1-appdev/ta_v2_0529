class Equipment < ApplicationRecord
  # Direct associations

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => :pieces_of_equipment_count

  # Indirect associations

  # Validations

end
