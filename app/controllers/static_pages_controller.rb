class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @new_post = current_user.posts.build
  end
end
