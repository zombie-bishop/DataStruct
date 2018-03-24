class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :name, presence: true
  has_many :data_struct
  after_create :create_data_struct

  def create_data_struct
    self.data_struct.create!
  end

end
