class SearchesController < ApplicationController  
  def create
    respond_with Search.create(params[:search])
  end
end
