
Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*' # You can change '*' to a specific origin if you only want to allow requests from certain origins.
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end