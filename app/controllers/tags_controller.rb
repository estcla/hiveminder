class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    if params[:search]
      @tags = Tag.search(params[:search]).order("created_at DESC")
    end
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @hives = Hive.tagged_with(@tag.name)
  end
end
