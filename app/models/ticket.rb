class Ticket < ActiveRecord::Base
  acts_as_paranoid column: :canceled_at

  belongs_to :user
  belongs_to :event

  validates :comment, length: { maximum: 30 }, allow_blank: true
end
