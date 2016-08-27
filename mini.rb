class Mini < Sinatra::Base
  use Rack::Session::Cookie
  use OmniAuth::Strategies::Doorkeeper

  get '/auth/:name/callback' do
    auth = request.env['omniauth.auth']
    "#{auth.inspect}"
  end

  get "/" do
    "Welcome to Mini!"
  end

  get "/urls/new/?" do
    erb :new
  end

  post "/urls/?" do
    url = Url.create(original: params[:original])
    short = Bijective.encode(url.id)
    redirect to "/#{short}/info"
  end

  post "/urls.json" do
    url = Url.create(original: params[:original])
    short = Bijective.encode(url.id)
    {url: { short: "#{request.base_url}/#{short}", original: url.original}}.to_json
  end

  get "/:short/info/?" do
    url = Url[Bijective.decode(params[:short])]
    erb :info, locals: { url: url }
  end

  get "/:short/?" do
    url = Url[Bijective.decode(params[:short])]
    url.count += 1
    url.save_changes
    redirect url.original
  end

end
