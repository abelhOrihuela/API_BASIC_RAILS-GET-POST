class Api::KindlesController < ApplicationController

  respond_to :json
  PER_PAGE_RECORDS = 9

  def index
    kindles_paginated = Kindle.order('id').page(params[:page]).per(PER_PAGE_RECORDS)
  end

end
