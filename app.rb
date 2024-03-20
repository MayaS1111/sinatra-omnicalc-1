require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_new)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @apr = params.fetch("users_number_apr").to_i.to_fs(:percentage, { :precision => 4 })
  @years = params.fetch("users_number_years").to_i
  @principal = params.fetch("users_number_principal").to_i.to_fs(:currency)

  r = params.fetch("users_number_apr").to_f / 1200
  n = params.fetch("users_number_years").to_i * 12
  pv = params.fetch("users_number_principal").to_i

  numerator = r*(pv)
  denominator = 1 - (1 + r)**-n

  @payment = (numerator / denominator).to_fs(:currency)

  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  erb(:random_results)
end
