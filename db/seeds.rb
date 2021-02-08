# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all

User.create(name: "alan")
User.create(name: "cosmel")
User.create(name: "cristian")
User.create(name: "kevin")
User.create(name: "nata")
User.create(name: "will")

p "Created #{User.count} users"

Category.destroy_all

Category.create(name: "LURES", priority: 1)
Category.create(name: "RODS", priority: 2)
Category.create(name: "FRESH-WATER", priority: 3)
Category.create(name: "SALT-WATER", priority: 4)

p "Created #{Category.count} categories"

Fishing.destroy_all

Fishing.create(author_id: User.find_by(name: "nata").id, title: "Lure or bait", text: "Fusce laoreet condimentum urna vel volutpat." , votes_count: 1)
Fishing.create(author_id: User.find_by(name: "will").id, title: "Rods of the feature", text: "Fusce laoreet condimentum urna vel volutpat.", votes_count: 1)
Fishing.create(author_id: User.find_by(name: "alan").id, title: "Fishing on Amazonas", text: "Fusce laoreet condimentum urna vel volutpat.", votes_count: 1)
Fishing.create(author_id: User.find_by(name: "alan").id, title: "The correct weather for high seas", text: "Fusce laoreet condimentum urna vel volutpat.", votes_count: 1)
Fishing.create(author_id: User.find_by(name: "alan").id, title: "The best lures for fishing", text: "Fusce laoreet condimentum urna vel volutpat.", imagen: 'lures.jpg', votes_count: 2)
Fishing.create(author_id: User.find_by(name: "cosmel").id, title: "Flying rods", text: "Fusce laoreet condimentum urna vel volutpat.", imagen: 'Flying_rod.webp', votes_count: 1)
Fishing.create(author_id: User.find_by(name: "cristian").id, title: "Salmon fishing", text: "Fusce laoreet condimentum urna vel volutpat.", imagen: 'salmon-fishing.jpeg', votes_count: 1)
Fishing.create(author_id: User.find_by(name: "kevin").id, title: "Fosil of the seas", text: "Fusce laoreet condimentum urna vel volutpat.", imagen: 'nautilus.png', votes_count: 1)

p "Created #{Fishing.count} articles"

Categorize.destroy_all

Categorize.create(category_id: Category.find_by(name: "LURES").id, fishing_id: Fishing.find_by(title: "Lure or bait").id)
Categorize.create(category_id: Category.find_by(name: "RODS").id, fishing_id: Fishing.find_by(title: "Rods of the feature").id)
Categorize.create(category_id: Category.find_by(name: "FRESH-WATER").id, fishing_id: Fishing.find_by(title: "Fishing on Amazonas").id)
Categorize.create(category_id: Category.find_by(name: "SALT-WATER").id, fishing_id: Fishing.find_by(title: "The correct weather for high seas").id)
Categorize.create(category_id: Category.find_by(name: "LURES").id, fishing_id: Fishing.find_by(title: "The best lures for fishing").id)
Categorize.create(category_id: Category.find_by(name: "RODS").id, fishing_id: Fishing.find_by(title: "Flying rods").id)
Categorize.create(category_id: Category.find_by(name: "FRESH-WATER").id, fishing_id: Fishing.find_by(title: "Salmon fishing").id)
Categorize.create(category_id: Category.find_by(name: "SALT-WATER").id, fishing_id: Fishing.find_by(title: "Fosil of the seas").id)

p "Created #{Categorize.count} categorizes"

Vote.destroy_all

Vote.create(user_id: User.find_by(name: "nata").id, fishing_id: Fishing.find_by(title: "The best lures for fishing").id)
Vote.create(user_id: User.find_by(name: "will").id, fishing_id: Fishing.find_by(title: "The best lures for fishing").id)

Vote.create(user_id: User.find_by(name: "alan").id, fishing_id: Fishing.find_by(title: "Lure or bait").id)
Vote.create(user_id: User.find_by(name: "alan").id, fishing_id: Fishing.find_by(title: "Rods of the feature").id)
Vote.create(user_id: User.find_by(name: "cristian").id, fishing_id: Fishing.find_by(title: "Fishing on Amazonas").id)
Vote.create(user_id: User.find_by(name: "kevin").id, fishing_id: Fishing.find_by(title: "The correct weather for high seas").id)
Vote.create(user_id: User.find_by(name: "alan").id, fishing_id: Fishing.find_by(title: "Flying rods").id)
Vote.create(user_id: User.find_by(name: "alan").id, fishing_id: Fishing.find_by(title: "Salmon fishing").id)
Vote.create(user_id: User.find_by(name: "alan").id, fishing_id: Fishing.find_by(title: "Fosil of the seas").id)

p "Created #{Vote.count} votes"