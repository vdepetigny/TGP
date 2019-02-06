require 'faker'
User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTableTagGossip.destroy_all
Message.destroy_all

4.times do
 city = City.create(name: Faker::Address.city, zip_code: "#{rand(00..99)}#{rand(00..99)}#{rand(00..99)}")
end

10.times do
 user = User.create(first_name: Faker::Name.first_name,last_name: Faker::Name.last_name, description: Faker::Friends.quote, email: Faker::Internet.email, age: Faker::Number.number(2), city: City.all.sample)
end

30.times do
 gossip = Gossip.create(title: Faker::Ancient.titan, content: Faker::HarryPotter.quote, user: User.all.sample)
end

10.times do
 tag = Tag.create(title: Faker::Ancient.hero)
end

10.times do
 join_table_tag_gossip = JoinTableTagGossip.create(gossip: Gossip.all.sample, tag: Tag.all.sample)
end

5.times do
 message = Message.create(content: Faker::FamousLastWords.last_words, recipient: User.all.sample, sender: User.all.sample)
end
