class TagsController < ApplicationController
    def show
      @tag = Tag.find_by(name: params[:name])
      @posts = @tag.posts if @tag
    end
    
    private 
    def tag_params
      params.require(:tag).permit(:name)
    end
  end