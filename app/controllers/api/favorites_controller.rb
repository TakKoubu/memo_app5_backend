module Api
  class FavoritesController < ApplicationController
    def create
      memo = Memo.find(params[:memo_id])
      if current_user.favorite(memo)
        render json: { favorite_count: memo.favorites.count }
      else
        render json: memo.errors, status: 422
      end
    end

    def destroy
      memo = current_user.favorite_memos.find(params[:memo_id])
      if current_user.unfavorite(memo)
        render json: { favorite_count: memo.favorites.count }
      else
        render json: memo.errors, status: 422
      end
    end
  end
end
