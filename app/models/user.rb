class User < ActiveRecord::Base
  has_one :author
  has_many :reviews
  has_many :books, through: :reviews
  validates :agreement, acceptance: { on: :create }
  validates :email, confirmation: true
  validates :email, presence: { unless: 'dm.blank?' }


  def self.authenticate(username, password)
    usr = find_by(username: username)
    if usr != nil &&
      usr.password == Digest::SHA1.hexdigest(usr.salt + password) then
      usr
    else
      return
    end
  end
end
