class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all #Blogの中にあるすべてのレコードを出力します
    # raise
  end

  def new
    @blog = Blog.new  #ビューにデータを渡す（インスタンス変数を定義する）
  end

  def create
    # Blog.create(title: params[:blog][:title], content: params[:blog][:content])# モデルにDB操作の命令を出す
    # Blog.create(blog_params)#Strong Parametersはcreateでもupdateでも使われる汎用性の高い処理なので,最初からメソッドとして定義し、どこからでもすぐに使える
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "ブログを作成しました!"
      else
        render :new
      end
    end
  end

  def show
    # @blog = Blog.find(params[:id])
  end
  
  def edit
    # @blog = Blog.find(params[:id])
  end
  
  def update
    # @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました!"
    else
      render :edit
    end
  end
    
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end 
  
  def confirm 
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end


  def set_blog
    @blog = Blog.find(params[:id])
  end
end

# def index ブラウザからGETメソッドで、/blogsというURLのリクエストが来た時に、blogsコントローラのindexアクションを起動する≥

