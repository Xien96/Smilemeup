class BlogController < ApplicationController
  def index
    @active = "blog"
  end

  def show
    @active = "blog"
  end
end
