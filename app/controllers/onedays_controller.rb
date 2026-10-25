class OnedaysController < ApplicationController
  def index
    @onedays = Oneday.all
  end

  def concrete
    date = Date.iso8601(params[:date].to_s)
    @posts = Post.where("DATE(start_time) = ?", date)
    @memos = Memo.where("DATE(created_at) = ?", date)
    @one_diaries = OneDiary.where(date: date)
  rescue Date::Error
    head :bad_request
  end
end
