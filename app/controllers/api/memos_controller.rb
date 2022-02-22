module Api
  class MemosController < ApplicationController
    def index
      memos = Memo.all
      render json: memos
    end

    def create
    end

    def destroy
    end
  end
end
