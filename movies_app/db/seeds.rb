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
              cast: ["Ian Ziering", "Tara Reid", "John Heard"],
              synopsis: "When a freak hurricane swamps Los Angeles, nature's deadliest killer rules sea, land, and air as thousands of sharks terrorize the waterlogged populace.",
              poster_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BOTE2OTk4MTQzNV5BMl5BanBnXkFtZTcwODUxOTM3OQ@@._V1_SY1000_CR0,0,712,1000_AL_.jpg")

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

comment = Comment.create(review_id: review.id, author_id: commenter.id, body: "I could not agree with you more!!")
