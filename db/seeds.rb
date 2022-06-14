# generate a roster of 10 customers
10.times do
    Customer.create(
        first_name: Faker::Name.unique.first_name,
        last_name: Faker::Name.unique.last_name, 
        card_number: Faker::Number.unique.number(digits: 16)
    )
    Merchant.create(
        name: Faker::Restaurant.name,
    )
end

# generate 100 transactions based on customers and merchants provided
100.times do
    Transaction.create(
        price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        date: Faker::Date.between(from: "2014-01-01", to: Date.today),
        customer: Customer.all.sample,
        merchant: Merchant.all.sample
    )
end

# reset uniqueness
Faker::UniqueGenerator.clear