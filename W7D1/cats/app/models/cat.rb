# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    SEX_TYPES = [
        "M", 
        "F"
    ]

    COLOR_TYPES = [
        "Red", 
        "Blue", 
        "Yellow", 
        "Green", 
        "Orange", 
        "Purple", 
        "Black", 
        "White"
    ]

    validates :birth_date, :color, :name, :sex, :description, presence: true
    validates :sex, inclusion: SEX_TYPES
    validates :color, inclusion: COLOR_TYPES

    def age
        today = Date.current
        current_age = today.year - self.birth_date.year
        if today.month < self.birth_date.month
            current_age -= 1
        elsif today.month == self.birth_date.month && today.day < birth_date.day
            current_age -= 1
        end
        current_age
    end
end
