class RankingController < ApplicationController
  def have
    array = Array.new
    Item.find_each(batch_size: 100) do |item|
      userCount = item.have_user_count
      if userCount > 0
        rankItem = {:count => userCount, :item => item}
        array.push(rankItem)
      end
    end
    sliceCount = array.count > 10? 10 : array.count
    rankItems = array.sort_by{|val| [-val[:count], -val[:count]]}.slice!(0, sliceCount)
    topRanks = Array.new
    rankItems.each do |item|
      topRanks.push(item[:item])
    end
    @items = topRanks
  end

  def want
    array = Array.new
    Item.find_each(batch_size: 100) do |item|
      userCount = item.want_user_count
      if userCount > 0
        rankItem = {:count => userCount, :item => item}
        array.push(rankItem)
      end
    end
    sliceCount = array.count > 10? 10 : array.count
    rankItems = array.sort_by{|val| [-val[:count], -val[:count]]}.slice!(0, sliceCount)
    topRanks = Array.new
    rankItems.each do |item|
      topRanks.push(item[:item])
    end
    @items = topRanks
  end
  
end
