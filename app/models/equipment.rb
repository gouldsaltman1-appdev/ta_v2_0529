class Equipment < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :category,
             :counter_cache => :pieces_of_equipment_count

  has_many   :loans

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => :pieces_of_equipment_count

  # Indirect associations

  # Validations

end
