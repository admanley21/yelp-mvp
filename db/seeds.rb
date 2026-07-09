# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."

restaurants_data = [
  { name: "Epicure", address: "75008 Paris", category: "french" },
  { name: "Pellegrini's", address: "66 Bourke St, Melbourne", category: "italian" },
  { name: "Chin Chin", address: "125 Flinders Ln, Melbourne", category: "chinese" },
  { name: "Shujinko", address: "225 Russell St, Melbourne", category: "japanese" },
  { name: "Fasta Pasta", address: "101 Main St, Mildura", category: "italian" }
]

restaurants_data.each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end

puts "Finished! Created #{Restaurant.count} restaurants."
