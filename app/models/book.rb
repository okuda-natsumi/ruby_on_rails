class Book < ActiveRecord::Base

  after_destroy :history_book
  private
  def history_book
    logger.info('deleted: ' + self.inspect)
  end
  
  has_many :reviews
  has_and_belongs_to_many :authors 
  has_many :users, through: :rebiews
  has_many :memos, as: :memoable
#  scope :gihyo, -> {where(publish: '技術評論社')}
#	scope :newer, -> {order(published: :desc)}
#	scope :top10, -> {newer.limit(10)}
#
#	validates :isbn,
#		presence: { message: 'は必須です' },
#		uniqueness: { allow_blank: true, message: '%{value}は一意でなければなりません' },
#		length: { is: 17, allow_blank: true,
#            message: '%{value}は%{count}桁でなければなりません'},
#		#format: { with: /\A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/,
#    #        allow_blank: true,
#    #        message: '%{value}は正しい形式ではありません' }
#	  isbn: true
#  validates :title,
#	  uniqueness: { scope: :publish },	
#    presence: true,
#		length: { minimum: 1, maximum: 100 }
#  validates :price,
#		numericality: { only_integer: true, less_than: 10000 }
#	validates :publish,
#		inclusion: { in: ['技術評論社', '翔泳社', '秀和システム', '日経BP社', 'ソシム']}
end
