# coding: utf-8
class HelloController < ApplicationController

  skip_before_action :check_logined, only: :list

#  before_action :check_logined, only: :view
#
#  private
#  def check_logined
#    if session[:usr] then
#      begin
#        @usr = User.find(session[:usr])
#      rescue ActiveRecord::RecordNotFound
#        reset_session
#      end
#    end
#    unless @usr
#      flash[:referer] = request.fullpath
#      redirect_to controller: :login, action: :index
#    end
#  end
	def index
	  render text: 'こんにちは、世界！'
	end
	
	def view
	  @msg = 'こんにちは、世界'
	end
	
	def view2
	  @msg = 'hello world'
	end
	
	def list
		@books = Book.all
	end
	
	def app_var
		render text: MY_APP['logo']['source']
	end

end
