class User < ActiveRecord::Base
  has_many :entries
  has_many :bookmarkings
  has_many :entries, through: :bookmarkings

  validates :name, :email, :password_hash, presence: true

 include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
