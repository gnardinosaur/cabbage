10.times do 
    User.create(username: Faker::Dessert.variety, balance: rand(100..1000).to_i)
end

10.times do 
    Portfolio.create(title: Faker::Restaurant.name, user_id: rand(1..10).to_i)
end

10.times do 
    Stock.create(price: rand(1..100).to_i, company_name: Faker::Company.name, symbol: Faker::Lorem.characters(number: 3))
end

10.times do 
    Transaction.create(portfolio_id: rand(1..10).to_i, stock_id: rand(1..10).to_i, share_price: rand(1..100).to_i, num_of_shares: rand(5..50).to_i)
end

