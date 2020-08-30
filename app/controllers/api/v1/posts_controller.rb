class Api::V1::PostsController < Api::V1::ApplicationApiController
  before_action :authenticate, except: %i(index)
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.includes(:challenges, user: [:profile]).paginate(:page => params[:page], :per_page => params[:per_page])
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @current_user.posts.new(post_params)
    if @post.valid?
      @post.save
      render :show
    else
      render json: @post.errors.messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_update_params)
      render :show
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1 []
  # DELETE /posts/1.json
  def destroy
    #@post.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = @current_user.post.includes(:challenges, :active_storage_attachments, user: [:profile]).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(
      :title,
      :description,
      :photo,
      :movie
    )
  end

  def post_update_params
    params.require(:post).permit(:title, :description)
  end
end
