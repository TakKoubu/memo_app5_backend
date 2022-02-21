module Api
  class FavoritesController < ApplicationController
    def create
      memo = Memo.find(params[:memo_id])
      if current_user.favorite(memo)
        render json: memo
      else
        render json: memo.errors, status: 422
      end
    end

    def destroy
    end
  end
end