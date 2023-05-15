class ListsController < ApplicationController


  def index
    @list = List.new
    @lists = List.all
  end

def create
    @list = List.new(list_params)
    if @list.save
    flash[:notice] = "Book was successfully created."
    redirect_to list_path(@list.id)
    else
      @lists = List.all
      render :index
    end
  end


  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end


  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to list_path(list.id)
    else
      @lists = List.all
      render :show
    end
  end

  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/index'  # 投稿一覧画面へリダイレクト
  end

  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
