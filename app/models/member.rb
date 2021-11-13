class Member < ApplicationRecord
  has_many :winning_games, class_name: 'GameDetail', foreign_key: 'winner_id'
  validates :first_name, :last_name , presence: true
  validates :mobile_number,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 10 }
  def games_played
    @game_played ||= GameDetail.where("member1_id = ? OR member2_id = ?", self.id, self.id)
  end

  def total_and_highest_scores
    score = 0
    highest_score = 0
    games_played.each do |g|
      member_score = g.member1_id == self.id ? g.member1_score : g.member2_score
      highest_score = [highest_score, member_score].max
      score += member_score
    end
    [score, highest_score] 
  end

  def avg_score
    return 0 if games_played.count == 0
    total_and_highest_scores[0] / games_played.count 
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
