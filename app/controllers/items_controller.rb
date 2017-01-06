class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
    if params[:q]
      q_ary = params[:q].gsub(/\p{blank}+/, ' ').split(' ')
      params[:q] = q_ary.delete_if{|o| o.size <= 1 }.join(' ')
      params[:q].size > 1 ? result : (render 'new')
    end
  end

  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
  
  def result
    response = RakutenWebService::Ichiba::Item.search(
      keyword: params[:q],
      imageFlag: 1,
    )
    @items = response.first(20)
  end
end
