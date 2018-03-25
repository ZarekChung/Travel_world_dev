class Spot < ApplicationRecord
  has_many :details ,dependent: :destroy
end
