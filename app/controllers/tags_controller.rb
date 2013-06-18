class TagsController < ApplicationController
  def new
    @tag = ActsAsTaggableOn::Tag.new
  end

  def create
    tag = ActsAsTaggableOn::Tag.create(params[:tag])
    tag_category = ActsAsTaggableOn::Tagging.find_by_context(params[:tag_category])
    tag.taggings << tag_category
  end

  def autocomplete
    tags = ActsAsTaggableOn::Tag.all(joins: :taggings,
                                     conditions: { taggings: 
                                       { context: params[:tags_type] } })
    render :json => tags.map{ |t| { :id => t.id, :value => t.name } }
  end
end
