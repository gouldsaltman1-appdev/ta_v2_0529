class Equipment < ApplicationRecord
  # Direct associations

  has_many   :loans

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => :pieces_of_equipment_count

  # Indirect associations

  # Validations

end
