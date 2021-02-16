# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

account = Account.create(name: "Store")
account.update_column(:api_key, "ukpFgFgokfriqXjsEaArf7zsLVtFifBE")

Article.create(name: "Remote control car", description: "Amazing remote control car", amount_cents: 120000)
Article.create(name: "Barbie", description: "Barbie's vacations on the beach", amount_cents: 170000)
Article.create(name: "Chess", description: "Gambito chess", amount_cents: 200000)
