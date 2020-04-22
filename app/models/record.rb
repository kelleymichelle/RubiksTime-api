class Record < ApplicationRecord
  validates :cube_time, presence: true
  
  belongs_to :user
  belongs_to :cube

end