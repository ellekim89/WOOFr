class User < ActiveRecord::Base
  has_secure_password

  has_many :dogs

  has_and_belongs_to_many :dogs

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false},
  format: {with: /@/}

  def display_name
    self.name || 'Dog Lover'
  end

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
end
