class User < ApplicationRecord
  has_many :tasks
  
  validates :name, presence: true, length: { maximum: 50 },
                   uniqueness: { case_sensitive: false }
  
  has_secure_password
end
