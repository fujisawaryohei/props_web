class PostsController < ApplicationController
  def index
    @user=User.new
    @user.reset_password_token = params[:reset_password_token]
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
