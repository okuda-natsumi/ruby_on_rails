class ViewController < ApplicationController
	def form_tag
		@book = Book.new
	end

	def field
		@book = Book.new
	end

	def html5
		@book = Book.new
	end

	def select
		@book = Book.new(publish: '技術評論社')
	end

	def col_select
		@book = Book.new(publish: '技術評論社')
		@books = Book.select(:publish).distinct
	end
	
	def col_select2
		@book = Book.new(publish: '技術評論社')
		@books = Book.select(:publish).distinct
	end

	def group_select
		@review = Review.new
		@authors = Author.all
	end
end
