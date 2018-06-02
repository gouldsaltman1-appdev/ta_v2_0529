class User < ApplicationRecord
  # Direct associations

  has_many   :loans,
             :foreign_key => "borrower_id"

  has_many   :pieces_of_equipment,
             :class_name => "Equipment",
             :foreign_key => "owner_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :loansgiven,
             :through => :pieces_of_equipment,
             :source => :loans

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
