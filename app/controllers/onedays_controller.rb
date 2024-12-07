class OnedaysController < ApplicationController
  def index
    @onedays = Oneday.all
  end

  def concrete
    binding.pry
    @posts = Post.where(created_at: params[:date])
    @memos = Memo.where(created_at: params[:date])
    @one_diaries = OneDiary.where(created_at: params[:date])
  end 

  private
    def oneday_params
      params.require(:oneday).permit(:date)
    end
end
