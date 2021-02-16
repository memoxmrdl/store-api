class Account < ApplicationRecord
  before_create :generate_api_key!

  validates :name, presence: true, uniqueness: true

  def generate_api_key!
    api_key = SecureRandom.base58(32)

    if persisted?
      update_attribute :api_key, api_key
    else
      self.api_key = api_key
    end
  end
end
