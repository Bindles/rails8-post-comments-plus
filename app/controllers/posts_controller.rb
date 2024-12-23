class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    # render turbo_stream: turbo_stream.append("xxx", html: "aaa")
    # format.turbo_stream { render turbo_stream: turbo_stream.append(:messages, partial: "message", locals: { message: @message }) }
    # render turbo_stream: turbo_stream.append("xxx", "<div>aaa</div>".html_safe)
    #
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        Turbo::StreamsChannel.broadcast_replace_to :posts_list, target: @post, partial: "posts/post", locals: { post: @post }
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_path, status: :see_other, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      # @post = Post.find(params.expect(:id))
      @post = Post.find(params[:id])  # Use params[:id], not params.expect(:id)
    end

    # Only allow a list of trusted parameters through.
    def post_params
      # params.expect(post: [ :title, :body ])
      params.require(:post).permit(:title, :body)  # Use .require and .permit to sanitize
    end
end
