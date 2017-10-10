#get 'route-name' do
#end

get '/' do
	erb :"static/index"
end

get '/blog' do
	erb :"static/blog"
end


#receiver
post '/urls' do
	@url = Url.new(long_url: params["long_url"], short_url: params["short_url"])
	
		if @url.save
			@url.shorten
			return @url.to_json
			
		else
			@error = @url.errors.full_messages.join(" ,")
			return @error.to_json
			
		end
	#redirect '/'
end

#when the short url is generated, link it back to the long url
get '/:short_url' do

    a = Url.find_by(short_url: params["short_url"])
    if a 
    	redirect a.long_url
    else
    	redirect '/'
    end

end