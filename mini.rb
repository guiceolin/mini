class Mini < Sinatra::Base

  get "/" do
    "Welcome to Mini!"
  end

  get "/urls/new" do
    erb :new
  end

  post "/urls/" do
    url = Url.create(original: params[:original])
    short = Bijective.encode(url.id)
    redirect to "/#{short}/info"
  end

  get "/:short/info" do
    url = Url[Bijective.decode(params[:short])]
    erb :info, locals: { url: url }
  end

  get "/:short" do
    url = Url[Bijective.decode(params[:short])]
    url.count += 1
    url.save_changes
    redirect url.original
  end

end
