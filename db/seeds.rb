p 'destroying all users, cars and bookings...'

User.destroy_all
Car.destroy_all
Booking.destroy_all

p 'all done'

User.create(email: "test@test.com", password: "123456")
User.create(email: "test2@test.com", password: "123456")
p 'users created'

Car.create(brand: "Renault", price: 50, address: "Paris")
Car.create(brand: "Peugeot", price: 40, address: "Lyon")
Car.create(brand: "Citroen", price: 30, address: "Marseille")
p 'cars created'
