# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Stock.destroy_all

s1 = Stock.create name: 'Google' , ticker: 'GOOG', price: 1014.55, industry: "Technology", description: "Technology company specalising in Search Engine, social media, and self driving"
s2 = Stock.create name: "Morgan Stanley", ticker: "MS", price: 40.10, industry: "Finance", description: "Multi national investment bank"
s3 = Stock.create name: "BHP Billiton", ticker: "BHP", price: 34.3, industry: "Mining", description: "Mining Company"
s4 = Stock.create name: "Uber", ticker: "UBER", price: 78.9, industry: "Transportation", description: "Uber for Uber"
s5 = Stock.create name: "Facebook", ticker: "FB", price: 178.34, industry: "Technology", description: "Social media giant"
s6 = Stock.create name: "21st Century Fox", ticker: "FOX", price: 34.15, industry: "Media", description: "Media conglomorate"
s7 = Stock.create name: "Snapchat", ticker: "SNAP", price: 17.12, industry: "Technology", description: "Ephemiral messaging"
s8 = Stock.create name: "CSL Limited", ticker: "CSL", price: 140.56, industry: "Health-Care", description: "Blood products"
s9 = Stock.create name: "Van Eck World Index", ticker: "QUAL", price: 34.67, industry: "Index Fund", description: "Global Index Fund"
s10 = Stock.create name: "Atlassian", ticker: "TEAM", price: 44.05, industry: "Technology", description: "Makes software for teams"

puts "Created #{Stock.all.length} Stocks"

Portfolio.destroy_all

p1 = Portfolio.create title: "Young Person Portfolio"
p2 = Portfolio.create title: "Old Person Portfolio"
p3 = Portfolio.create title: "Long Term Portfolio"
p4 = Portfolio.create title: "High Risk Portfolio"

puts "Created #{Portfolio.all.length}"

p1.stocks << s1 << s4 << s5 << s7 << s10
p2.stocks << s3 << s6 << s8 << s9 << s2
p3.stocks << s9 << s3 << s5 << s1
p4.stocks << s7 << s4

User.destroy_all

u1 = User.create name: 'Darren Hill', email: 'dh@gmail.com', password: 'chicken'
u2 = User.create name: 'Gregory McIntosh', email: 'gm@gmail.com', password: 'chicken'
u3 = User.create name: 'Rafiki', email: 'raf@gmail.com', password: 'chicken'

puts "Created #{User.all.length} Users"

u1.portfolios << p1 << p4
u2.portfolios << p2
u3.portfolios << p3







# end
