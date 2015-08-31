class Author < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :books
  has_many :memos, as: :memoable
end
