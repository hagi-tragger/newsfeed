class Vote < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

  validates :value, :numericality => true
  validate :check_value

  after_save do |vote|
    post = Post.find(vote.post_id)
    post.rating += vote.value
    post.save!
  end

  protected
  
  def check_value
    errors.add(:value, "should be -1 or 1") if value < -1 || value > 1
  end

end
