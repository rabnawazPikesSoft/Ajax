class BlogsController < ApplicationController
  before_action :get_all, only: [:index, :create, :update, :destroy]
  # GET /blogs
  # GET /blogs.json
  def index
     @blogs = Blog.all
    respond_to do |format|
      format.html
      format.json
    end
  end
    

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.find_by(id: params[:id])
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find_by(id: params[:id])
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.create(blog_params)
  end

  # PATCH/PUT /blogs/
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog = Blog.find_by(id: params[:id])
    if @blog.destroy
      redirect_to blogs_url
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end
    def get_all
      @blogs = Blog.all
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:first_name, :last_name, :age)
    end
end
