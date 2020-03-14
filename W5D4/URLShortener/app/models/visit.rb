# == Schema Information
#
# Table name: visits
#
#  id               :bigint           not null, primary key
#  user_id          :integer          not null
#  shortened_url_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Visit < ApplicationRecord
  validates :user_id, presence:true
  validates :shortened_url_id, presence:true

  belongs_to :visitor,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUrl

def self.record_visit!(user,shortened_url)
  v = Visit.create({user_id: user.id, shortened_url_id: shortened_url.id})
  # v.user_id = user.id
  # v.shortened_url_id=shortened_url.id
  # v
end
end
