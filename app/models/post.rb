# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  content    :text
#  url        :string
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
    validates :title, presence: true 

    belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User
end
