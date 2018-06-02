class Loan < ApplicationRecord
  # Direct associations

  belongs_to :borrower,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
