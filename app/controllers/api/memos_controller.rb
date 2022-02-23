module Api
  class MemosController < ApplicationController
    def index
      favorite_memo_ids = current_user.favorites.pluck(:memo_id)
      memos = Memo.all.map do |memo|
        memo.favorite_count = memo.favorites.count
        memo.is_like = memo.id.in?(favorite_memo_ids)
        memo
      end
      render json: memos.to_json(methods: [:favorite_count, :is_like])
    end

    def create
      memo = current_user.memos.build(memo_params)
      if memo.save
        render json: memo
      else
        render json: memo.errors, status: 422
      end
    end

    def destroy
      memo = Memo.find(params[:id])
      memo.destroy!
    end

    def show
      memo = Memo.find(params[:id])
      render json: memo
    end

    def search
      memos = Memo.ransack(search_params).result(distinct: true)
      render json: memos
    end
    
    private
    def memo_params
      params.require(:memo).permit(:content)
    end

    def search_params
      params.require(:q).permit(:content_cont)
    end
  end
end
