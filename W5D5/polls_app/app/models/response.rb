# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord

    validates :user_id, :answer_choice_id, presence: true
    validate :not_duplicate_response, :not_author_respondent

    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: :AnswerChoice

    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    has_one :question,
        through: :answer_choice,
        source: :question

    def sibling_responses
        question.responses.where.not(id: self.id)
    end

    def respondent_already_answered?
        sibling_responses.exists?(user_id: respondent.id)
    end

    def not_duplicate_response
        if respondent_already_answered?
        errors[:respondent] << 'already answered this question'
        end
    end

    def not_author_respondent
        if question.poll.user_id == self.user_id
            errors[:respondent] << 'can not be the author of the poll'
        end
    end
end
