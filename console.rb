require('pry')
require_relative('./models/film')
require_relative('./models/customer')
require_relative('./models/ticket')

Customer.delete_all
Film.delete_all
Ticket.delete_all

customer1 = Customer.new({"name" => "Sven", "funds" => 100})
customer2 = Customer.new({"name" => "Jaden", "funds" => 30})
customer3 = Customer.new({"name" => "Tiffany", "funds" => 60})
customer4 = Customer.new({"name" => "Josh", "funds" => 25})
customer5 = Customer.new({"name" => "Kimberley", "funds" => 30})
customer6 = Customer.new({"name" => "Rebecca", "funds" => 55})

film1 = Film.new({"title" => "Inception", "price" => 15})
film2 = Film.new({"title" => "The Dark Knight", "price" => 12})
film3 = Film.new({"title" => "Whiplash", "price" => 10})
film4 = Film.new({"title" => "The Mummy", "price" => 8})
film5 = Film.new({"title" => "John Wick", "price" => 20})

ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id})
ticket2 = Ticket.new({"customer_id" => customer1.id, "film_id" => film2.id})
ticket3 = Ticket.new({"customer_id" => customer1.id, "film_id" => film5.id})
ticket4 = Ticket.new({"customer_id" => customer2.id, "film_id" => film3.id})
ticket5 = Ticket.new({"customer_id" => customer3.id, "film_id" => film1.id})
ticket6 = Ticket.new({"customer_id" => customer3.id, "film_id" => film5.id})
ticket7 = Ticket.new({"customer_id" => customer4.id, "film_id" => film3.id})
ticket8 = Ticket.new({"customer_id" => customer4.id, "film_id" => film4.id})
ticket9 = Ticket.new({"customer_id" => customer5.id, "film_id" => film2.id})
ticket10 = Ticket.new({"customer_id" => customer5.id, "film_id" => film4.id})
ticket11 = Ticket.new({"customer_id" => customer6.id, "film_id" => film2.id})
ticket12 = Ticket.new({"customer_id" => customer6.id, "film_id" => film5.id})
