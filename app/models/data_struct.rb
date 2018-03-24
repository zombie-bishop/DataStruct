class DataStruct < ApplicationRecord
  belongs_to :user
  has_many :data_prop
end
