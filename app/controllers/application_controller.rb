class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

get '/bakeries' do
     bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_good_expensive = BakedGood.all.order(:price).max
   baked_good_expensive.to_json
   
  
  end

end
