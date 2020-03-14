# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
  validates :short_url, presence:true, uniqueness:true
  validates :long_url, presence:true
  validates :user_id, presence:true

  belongs_to :submitter,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id, 
    class_name: :Visit

    has_many :visitors,
      through: :visits,
      source: :visitor

  def self.random_code
    code = ""
    until code.length > 0 && !ShortenedUrl.exists?(:short_url=>code)
      code = "www.#{SecureRandom::urlsafe_base64}.com"
    end
    code
  end

  def self.url_shortener(user, long_url)
    n = ShortenedUrl.new
    n.user_id = user.id
    n.long_url = long_url
    n.short_url = ShortenedUrl.random_code
    n
  end

  def num_clicks
    Visit.all.select {|v| v.shortened_url_id == self.id}.length
  end

  def num_uniques
    Visit.all.select(:user_id).distinct {|v| v.shortened_url_id == self.id}.length
  end
  
  def num_recent_uniques
    Visit.all.select(:user_id).distinct.where(self.created_at >= 10.minutes.ago) 
    {|v| v.shortened_url_id == self.id}.length
  end




end
