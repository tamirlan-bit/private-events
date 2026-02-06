class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :attendances, dependent: :destroy
  has_many :guests, through: :attendances, source: :user

  validates :date, :location, presence: true

  scope :public_events, -> { where(public: true) }
  scope :past, -> { where("date < ?", Date.current) }
  scope :upcoming, -> { where("date >= ?", Date.current) }  
end
