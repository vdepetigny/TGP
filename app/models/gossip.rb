class Gossip < ApplicationRecord
	belongs_to :user, dependent: :destroy
	has_many :join_table_tag_gossips, dependent: :destroy
	has_many :tags, through: :join_table_tag_gossips, dependent: :destroy
	validates :title, presence: true
  validates :content, presence: true
end
