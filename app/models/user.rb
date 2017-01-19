class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable
  acts_as_messageable
end
