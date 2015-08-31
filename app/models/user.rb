class User < ActiveRecord::Base
	validates :agreement, acceptance: true
end
