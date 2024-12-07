# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*" # Adjust this if your external site is hosted elsewhere
    resource "*", headers: :any, methods: [ :get, :post, :options ]
  end
end
