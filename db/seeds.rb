20.times do  
  member = Member.new
  member.first_name = Faker::Name.first_name
  member.last_name = Faker::Name.last_name
  member.joining_date = Faker::Date.in_date_period
  member.mobile_number =  rand(10000000000)
  member.save
end

100.times do
	game_detail = GameDetail.new
	game_detail.member1_id = Member.all.shuffle.first.id
	game_detail.member2_id = Member.all.shuffle.first.id
	game_detail.member1_score = Faker::Number.between(from: 1, to: 100)
	game_detail.member2_score = Faker::Number.between(from: 1, to: 100)
	game_detail.place = Faker::Address.city
	game_detail.winner_id = game_detail.member1_score > game_detail.member2_score ? game_detail.member1_id : game_detail.member2_id
	game_detail.time_of_game_played = Faker::Date.in_date_period
	game_detail.save
end