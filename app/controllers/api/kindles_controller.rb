class Api::KindlesController < ApplicationController


  respond_to :json
  PER_PAGE_RECORDS = 10

  skip_before_filter :verify_authenticity_token

  def index
    kindles_paginated = Kindle.order('id').page(params[:page]).per(PER_PAGE_RECORDS)
    json_response = {
      models: kindles_paginated,
      current_page: params[:page].to_i,
      perPage: PER_PAGE_RECORDS,
      total_pages: kindles_paginated.num_pages
    }
    respond_with json_response

    #respond_with kindles_paginated , callback: params[:callback]
  end

  def new
    @kindle = Kindle.new
  end

  def create

    puts "***"+ kindle_params[:status]
    kindle = Kindle.new kindle_params
    kindle.save
    respond_with kindle, location: nil

  end

  def show
    respond_with Kindle.find(params[:id])
  end

  def update
    respond_with Kindle.update(params[:id], kindle_params)
  end

  def destroy
    respond_with kindle.destroy(params[:id])
  end

  def kindle_params
    params.require(:kindle).permit(:inventory_id, :status)
  end


end
