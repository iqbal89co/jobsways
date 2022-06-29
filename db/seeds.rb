# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
10.times do
    Job.create(
        title: Faker::Job.title,
        position: Faker::Job.position,
        salary: 500_000 * rand(7..20),
        salary_upto: nil,
        location: "Jakarta, Indonesia",
        job_type: "full-time",
        description: Faker::Lorem.sentence(word_count: rand(50..80)),
        status: "hiring"
    )
end
# Job.all.each do |job|
#   10.times do
#     job.title.create(body: Faker::Job.title)
#     job.position.create(body: Faker::Job.position)
#     job.salary.create(body: (500_000 * rand(7..20)))
#     job.salary_upto.create(body: nil)
#     job.location.create(body: "Jakarta, Indonesia")
#     job.job_type.create(body: "full-time")
#     job.description.create(body: Faker::Lorem.paragraphs(sentence_count: rand(5..8)))
#     job.status.create(body: "hiring")
#   end
# end