class Player < ApplicationRecord
  belongs_to :team
  has_many :competitions, through: :team

end
