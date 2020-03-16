# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  text       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord

    validates :text, :poll_id, presence:true

    has_many :answer_choices,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :AnswerChoice

    belongs_to :poll,
        primary_key: :id,
        foreign_key: :poll_id,
        class_name: :Poll

    has_many :responses,
        through: :answer_choices,
        source: :responses

    def title
        self.text
    end

    def results
        hash = {}
        answer_choices.each do |answer|
            hash[answer.text] = answer.responses.count
        end
        hash
    end


end
