10.times do 
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Dessert.variety, balance: rand(100..1000))
end

10.times do 
    Portfolio.create(title: Faker::Restaurant.name, user_id: rand(1..10), cash: 0)
end

10.times do 
    Stock.create(price: rand(1..100).to_i, company_name: Faker::Company.name, symbol: Faker::Lorem.characters(number: 3))
end

10.times do 
    Transaction.create(portfolio_id: rand(1..10), stock_id: rand(1..10), share_price: rand(1..100), num_of_shares: rand(5..50))
end

