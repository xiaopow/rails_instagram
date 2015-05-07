class PostsController < ApplicationController
  # List out all Posts
  def index
    @posts = Post.all.sort # retrieve all the posts data and store them in the variable @posts (step 3 to 6)
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render :json => { message: "saved" }
    else
      render :json => { message: "not saved" }
    end
  end

  def show
    # "/posts/1"
    @post = Post.find_by_id(params[:id])

    if @post.nil?
      render :json => {
        message: "Cannot find post with id=#{params[:id]}"
      }
    end
  end

  def highlighted
    @posts = Post.where(highlighted: true).sort

    if @posts.nil?
      render :json => {
        message: "No highlighted posts"
      }
    end
  end

  def update
    @post = Post.find_by_id(params[:id])

    if @post.nil?
      render :json => {
        message: "Cannot find post with id=#{params[:id]}"
      }
    else
      if @post.update(post_params)
        render :json => { message: "updated"}
      else 
        render :json => { message: "not updated"}
      end
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])

    if @post.nil?
      render :json => {
        message: "Cannot find post with id=#{params[:id]}"
      }
    else
      if @post.destroy
        render :json => { message: "deleted"}
      else 
        render :json => { message: "not deleted"}
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category)
  end

  # data = {
  #   post: {
  #     title: '',
  #     content: '',
  #     category: ''
  #   }
  # }

end
