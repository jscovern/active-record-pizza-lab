class PizzaShop < Sinatra::Base
	require 'json'

	# index
	get '/pizzas' do
    	@pizzas = Pizza.all
    	@pizzas.to_json
  	end

  	# show
  	get '/pizzas/:id' do
  		@pizza = Pizza.find(params[:id])
  		@pizza.to_json
  	end

  	# create
  	post '/pizzas' do
  		request.body.rewind
  		new_pizza = request.body.read
  		parse_new_pizza = JSON.parse(new_pizza)
	    Pizza.create(parse_new_pizza)
  		parse_new_pizza
  	end

  	# update
  	put '/pizzas/:id' do
  		request.body.rewind
  		updated_pizza = request.body.read
  		parsed_pizza = JSON.parse(updated_pizza)
  		pizza_to_update = Pizza.find(params[:id])
  		pizza_to_update.update_attributes(parsed_pizza)
  	end

  	# delete
  	delete '/pizzas/:id' do
  		pizza_to_delete = Pizza.find(params[:id])
  		pizza_to_delete.destroy
  	end
end
