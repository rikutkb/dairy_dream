# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
    User.create!(
        email:"test#{n+1}@test.com",
        name:"test#{n+1}",
        password:"password"
    )
end
User.all.each do |user|
    user.tags.create!(
        name:'実家',
        kind:0
    )
    user.tags.create!(
        name:'学校',
        kind:0
    )
    user.tags.create!(
        name:'家',
        kind:0
    )
    user.tags.create!(
        name:'兄',
        kind:1
    )
    user.tags.create!(
        name:'父',
        kind:1
    )
end