class Api::KindlesController < ApplicationController


  respond_to :json
  PER_PAGE_RECORDS = 9

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

  def create
    a = Kindle.create(kindle_params)
    respond_with kindle, location: nil
  end

  def show
    respond_with kindle.find(params[:id])
  end

  def update

  end



end
