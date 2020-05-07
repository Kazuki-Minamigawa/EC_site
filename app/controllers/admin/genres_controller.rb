class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルが作成されました。"
      redirect_to admin_genres_path
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルを変更しました。"
      redirect_to admin_genres_path
    else
      render "edit"
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_allowed)
  end

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction,
                                 :is_sold, :no_tax_price, :image)
  end
end
