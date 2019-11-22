require('pry')
require_relative('./models/films')
require_relative('./models/customers')
require_relative('./models/tickets')
require_relative('./models/screenings')

Customer.delete_all
Film.delete_all
Ticket.delete_all
Screening.delete_all

customer1 = Customer.new({"name" => "Sven", "funds" => 100})
customer1.save
customer2 = Customer.new({"name" => "Jaden", "funds" => 30})
customer2.save
customer3 = Customer.new({"name" => "Tiffany", "funds" => 60})
customer3.save
customer4 = Customer.new({"name" => "Josh", "funds" => 25})
customer4.save
customer5 = Customer.new({"name" => "Kimberley", "funds" => 30})
customer5.save
customer6 = Customer.new({"name" => "Rebecca", "funds" => 55})
customer6.save

film1 = Film.new({"title" => "Inception", "price" => 15})
film1.save
film2 = Film.new({"title" => "The Dark Knight", "price" => 12})
film2.save
film3 = Film.new({"title" => "Whiplash", "price" => 10})
film3.save
film4 = Film.new({"title" => "The Mummy", "price" => 8})
film4.save
film5 = Film.new({"title" => "John Wick", "price" => 20})
film5.save

ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id})
ticket1.save
ticket2 = Ticket.new({"customer_id" => customer1.id, "film_id" => film2.id})
ticket2.save
ticket3 = Ticket.new({"customer_id" => customer1.id, "film_id" => film5.id})
ticket3.save
ticket4 = Ticket.new({"customer_id" => customer2.id, "film_id" => film3.id})
ticket4.save
ticket5 = Ticket.new({"customer_id" => customer3.id, "film_id" => film1.id})
ticket5.save
ticket6 = Ticket.new({"customer_id" => customer3.id, "film_id" => film5.id})
ticket6.save
ticket7 = Ticket.new({"customer_id" => customer4.id, "film_id" => film3.id})
ticket7.save
ticket8 = Ticket.new({"customer_id" => customer4.id, "film_id" => film4.id})
ticket8.save
ticket9 = Ticket.new({"customer_id" => customer5.id, "film_id" => film2.id})
ticket9.save
ticket10 = Ticket.new({"customer_id" => customer5.id, "film_id" => film4.id})
ticket10.save
ticket11 = Ticket.new({"customer_id" => customer6.id, "film_id" => film2.id})
ticket11.save
ticket12 = Ticket.new({"customer_id" => customer6.id, "film_id" => film5.id})
ticket12.save

screening1 = Screening.new({"film_title" => "", "film_id" => film1.id, "screening_time" => '18:00'})
screening1.save

binding.pry
nil
