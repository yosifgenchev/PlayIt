OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1053478778072926', '5f9805f2d2c60ab9b45165c53b42ac25', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end