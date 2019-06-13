# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Share.destroy_all

s1 = Share.create name: 'Google' , ticker: 'GOOG', price: 1014.55, description: "Technology company specalising in Search Engine, social media, and self driving", quantity: 10
s2 = Share.create name: "Morgan Stanley", ticker: "MS", price: 40.10, description: "Multi national investment bank", quantity: 67
s3 = Share.create name: "BHP Billiton", ticker: "BHP", price: 34.3, description: "Mining Company", quantity: 98
s4 = Share.create name: "Uber", ticker: "UBER", price: 78.9, description: "Uber for Uber", quantity: 100
s5 = Share.create name: "Facebook", ticker: "FB", price: 178.34, description: "Social media giant", quantity: 87
s6 = Share.create name: "21st Century Fox", ticker: "FOX", price: 34.15, description: "Media conglomorate", quantity: 345
s7 = Share.create name: "Snapchat", ticker: "SNAP", price: 17.12, description: "Ephemiral messaging", quantity: 451
s8 = Share.create name: "CSL Limited", ticker: "CSL", price: 140.56, description: "Blood products", quantity: 109
s9 = Share.create name: "Van Eck World Index", ticker: "QUAL", price: 34.67, description: "Global Index Fund", quantity: 201
s10 = Share.create name: "Atlassian", ticker: "TEAM", price: 44.05, description: "Makes software for teams", quantity: 372

puts "Created #{Share.all.length} Shares"

Portfolio.destroy_all

p1 = Portfolio.create title: "Young Person Portfolio"
p2 = Portfolio.create title: "Old Person Portfolio"
p3 = Portfolio.create title: "Long Term Portfolio"
p4 = Portfolio.create title: "High Risk Portfolio"

puts "Created #{Portfolio.all.length}"

p1.shares << s1 << s4 << s5 << s7 << s10
p2.shares << s3 << s6 << s8 << s9 << s2
p3.shares << s9 << s3 << s5 << s1
p4.shares << s7 << s4

User.destroy_all

u1 = User.create name: 'Darren Hill', email: 'dh@gmail.com', password: 'chicken', funds: 173450
u2 = User.create name: 'Gregory McIntosh', email: 'gm@gmail.com', password: 'chicken', funds: 66879
u3 = User.create name: 'Rafiki', email: 'raf@gmail.com', password: 'chicken', funds: 1000000

puts "Created #{User.all.length} Users"

u1.portfolios << p1 << p4
u2.portfolios << p2
u3.portfolios << p3







# end
