class HomesController < ApplicationController
  def top
    @book = Book.new
    @books = Book.all
  end

  def about
    @book = Book.new
    @books = Book.all
  end

end
