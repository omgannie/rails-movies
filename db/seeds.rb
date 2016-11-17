# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

annie = User.create(
            username: "annie_oh",
            email: "annie@oh.com",
            password: "123456",
            trusted_reviewer: true
        )

commenter = User.create(
            username: "commenter",
            email: "commenter@commenting.com",
            password: "123456",
            trusted_reviewer: false
        )

horror = Category.create(genre: "Horror")

sharknado = Movie.create(title: "Sharknado",
              release_date: "July 11, 2013",
              cast: "Ian Ziering, Tara Reid John Heard",
              synopsis: "When a freak hurricane swamps Los Angeles, nature's deadliest killer rules sea, land, and air as thousands of sharks terrorize the waterlogged populace.",
              poster_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BOTE2OTk4MTQzNV5BMl5BanBnXkFtZTcwODUxOTM3OQ@@._V1_SY1000_CR0,0,712,1000_AL_.jpg")


boo = Movie.create(title: "Boo",
              release_date: "July 11, 2013",
              cast: "Ian Ziering, Tara Reid John Heard",
              synopsis: "When a freak hurricane swamps Los Angeles, nature's deadliest killer rules sea, land, and air as thousands of sharks terrorize the waterlogged populace.",
              poster_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTUxNTE2MTM0NF5BMl5BanBnXkFtZTgwNjE5MTIxMDI@._V1_UX182_CR0,0,182,268_AL_.jpg")


sharknado = Movie.create(title: "Snakes on a Plane",
              release_date: "July 11, 2013",
              cast: "Ian Ziering, Tara Reid John Heard",
              synopsis: "When a freak hurricane swamps Los Angeles, nature's deadliest killer rules sea, land, and air as thousands of sharks terrorize the waterlogged populace.",
              poster_url: "https://i.jeded.com/i/snakes-on-a-plane.14345.jpg")

sharknado_is_horror = Genre.create(category_id: horror.id, movie_id: sharknado.id)

review = Review.create(
          title: "An Amazing Film!",
          body: "Upon watching this film for the very first time, I was blissfully unaware of what has been missing in my life this whole time. Shark Tornados. The epitome of creative genius, and this trusted reviewer highly recommends.",
          reviewer_id: annie.id,
          movie_id: sharknado.id
          )

rating1 = Rating.create(
          rateable_type: "Review",
          rateable_id: review.id,
          value: 5
          )

rating2 = Rating.create(
          rateable_type: "Movie",
          rateable_id: sharknado.id,
          value: 4
          )

rating3 = Rating.create(
          rateable_type: "Review",
          rateable_id: review.id,
          value: 2
)

rating4 = Rating.create(
          rateable_type: "Movie",
          rateable_id: sharknado.id,
          value: 1
)

review.update_attributes(ratings: [rating1, rating3])

sharknado.update_attributes(ratings: [rating2, rating4])

# comment = Comment.create(review_id: review.id, author_id: commenter.id, body: "I could not agree with you more!!")
category1 = Category.create(genre: "Action")
category2 = Category.create(genre: "Adventure")
category3 = Category.create(genre: "Comedy")
category4 = Category.create(genre: "Crime")
category5 = Category.create(genre: "Drama")
category6 = Category.create(genre: "Historic")
category7 = Category.create(genre: "Horror")
category8 = Category.create(genre: "Musical")
category9 = Category.create(genre: "Sci-fi")
category10 = Category.create(genre: "Western")
category10 = Category.create(genre: "Sports")

Genre.create(category: category1, movie: sharknado)
