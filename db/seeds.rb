# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Customer.destroy_all
Basket.destroy_all


Customer.create!([{
  first_name: "Patrick",
  last_name: "Hemorty",
  email: "pp@lol.fr",
  phone: "06872871222"
},
{
  first_name: "Paul",
  last_name: "Istirene",
  email: "poloLecrazy@tmtc.bg",
  phone: "06872871222"
},
{
  first_name: "Quentin",
  last_name: "Tamard",
  email: "qq@tmtc.bg",
  phone: "06872871222"
},
{
  first_name: "Annie",
  last_name: "Plusnimoins",
  email: "annizy@tmtc.bg",
  phone: "06872871222"
},
{
  first_name: "Justine",
  last_name: "A-Arena",
  email: "justleblanc@tmtc.bg",
  phone: "06872871222"
},
{
  first_name: "Valentin",
  last_name: "Tinetmilou",
  email: "valociraptor@tmtc.bg",
  phone: "06872871222"
},
{
  first_name: "Philippe",
  last_name: "Hipipe-Houra",
  email: "philou@tmtc.bg",
  phone: "06872871222"
},
{
  first_name: "Julien",
  last_name: "Achté-Hemel",
  email: "jujujuju@tmtc.bg",
  phone: "06872871222"
},
{
  first_name: "Elisa",
  last_name: "Simpson",
  email: "eliso@tmtc.bg",
  phone: "06872871222"
},
{
  first_name: "Baptiste",
  last_name: "Gael",
  email: "baptetG@tmtc.bg",
  phone: "06872871222"
},
{
 first_name: "Nathalie",
  last_name: "Gathor",
  email: "natou@yahoo.raou",
  phone: "06872871222"
},
{
  first_name: "Yvan",
  last_name: "Tilator",
  email: "papa@admin",
  password: "mdp",
  admin: true
}])
p "Created #{Customer.count} customers"

(0..140).step(7) do |n|

  Basket.create({
    content: 50.times.map { (0...(rand(10))).map { ('a'..'z').to_a[rand(26)] }.join }.join(" "),
    date: n.days.from_now
  })
end
Basket.create({
  content: "Le panier contient voilàa voilà",
  exceptional_sale: true,
  exceptional_sale_content: "Tomates et melons",
  date: 3.days.from_now
})
p "Created #{Basket.count} baskets"