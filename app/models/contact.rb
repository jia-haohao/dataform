class Contact < ApplicationRecord
  validates :name, :email, :content, presence: true
  validates :content, length: {in: 1..140}
end
