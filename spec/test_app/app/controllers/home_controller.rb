class HomeController < ApplicationController
  before_action do
    params[:depth] = params[:depth].present? ? params[:depth].to_i : 10
  end

  before_action do
    @tags = Tag.where(id: 1)
              .first
              .hash_tree(limit_depth: params[:depth])
  end

  def index
  end

  def show
  end
end
