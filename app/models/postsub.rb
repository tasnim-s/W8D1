class Postsub < ApplicationRecord
    belongs_to :posts
    belongs_to :subs
end
