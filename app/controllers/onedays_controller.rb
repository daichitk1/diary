class OnedaysController < ApplicationController
  def index
    @onedays = Oneday.all
  end

  def concrete
    @posts = Post.where('start_time LIKE ?', "#{params[:date]}%")
    @today_memos = Memo.where("DATE(created_at) = ?", "#{params[:date]}%")
    @one_diaries = OneDiary.where("DATE(created_at) = ?", "#{params[:date]}%")
  end 

  private
    def oneday_params
      params.require(:oneday).permit(:date)
    end
end
