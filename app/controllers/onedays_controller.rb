class OnedaysController < ApplicationController
  before_action :logged_in_user
  def index
    @onedays = Oneday.all
  end

  def concrete
    @posts = Post.where('start_time LIKE ?', "#{params[:date]}%")
    @memos = Memo.where('created_at LIKE ?', "#{params[:date]}%")
    @one_diaries = OneDiary.where('created_at LIKE ?', "#{params[:date]}%")
  end 

  private
    def oneday_params
      params.require(:oneday).permit(:date)
    end
end
