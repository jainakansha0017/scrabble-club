class GameDetail < ApplicationRecord
	belongs_to :first_member, class_name: 'Member', foreign_key: 'member1_id'
	belongs_to :second_member, class_name: 'Member', foreign_key: 'member2_id'
	belongs_to :winner, class_name: 'Member', foreign_key: 'winner_id'
	validates :member1_id, :member2_id, :member1_score, :member2_score, presence: true
end
