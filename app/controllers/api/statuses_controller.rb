module Api
  class StatusesController < ApplicationController
    def update
      memo = Memo.find(params[:memo_id])
      memo.update(status_params)
      render json: memo
    end

    private
    
    def status_params
      params.require(:memo).permit(:status)
    end
  end
end
