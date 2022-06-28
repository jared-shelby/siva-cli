# reset uniqueness
Faker::UniqueGenerator.clear

merchants = [
    "Starbucks",
    "McDonald's",
    "Wendy's",
    "Taco Bell",
    "Apple",
    "Amazon",
    "Costco",
    "Macy's",
    "Panera Bread",
    "Home Depot"
]

# generate pre-defined merchants
merchants.each {|merchant| Merchant.create(name: merchant)}

# generate random customers
10.times do
    Customer.create(
        first_name: Faker::Name.unique.first_name,
        last_name: Faker::Name.unique.last_name, 
        card_number: Faker::Number.unique.number(digits: 16),
        birthday: Date.new(2020, 4, 15)
    )
end

# generate random transactions
100.times do
    Transaction.create(
        price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        date: Faker::Date.between(from: "2014-01-01", to: Date.today),
        customer: Customer.all.sample,
        merchant: Merchant.all.sample
    )
end
