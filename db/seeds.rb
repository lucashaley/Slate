# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

## User data
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'user_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  u = User.new
  u.student_id = row['student_id']
  u.first_name = row['first_name']
  u.last_name = row['last_name']
  u.email = row['email']
  u.save
  puts "#{u.first_name} #{u.last_name} saved"
end

puts "There are now #{User.count} rows in the users table"
