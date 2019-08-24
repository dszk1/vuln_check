class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_param)
    if @post.save
      flash[:success] = "正常に投稿が完了しました"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  def show
    @post = Post.find(params[:id])
    # @post = current_user.posts.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    # @post = current_user.posts.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    # @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_param)
      flash[:success] = "正常に編集が完了しました"
      redirect_to show
    else
      flash[:notice] = "編集に失敗しました"
      redirect_to edit
    end
  end

  def destroy
  end

  def post_param
    params.require(:post).permit(:subject, :content)
  end
end
