class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :name, :email, presence: true
end
