Restaurant.destroy_all
Review.destroy_all

CATEGORIES = %w[chinese italian japanese french belgian]

10.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: CATEGORIES.sample
  )
  
  3.times do
    Review.create(
      rating: Faker::Number.between(from: 0, to: 5),
      content: Faker::Restaurant.review,
      restaurant: restaurant
    )
  end
end
