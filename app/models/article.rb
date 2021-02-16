class Article < ApplicationRecord
  validates :name, :amount_cents, presence: true
end
