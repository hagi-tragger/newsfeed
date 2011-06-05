class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_many :votes
  has_and_belongs_to_many :tags
  has_many :voted_users, :through => :votes, :source => :user

  CATEGORIES = [
    ["News", "common"],
    ["Crime", "crime"],
    ["Technics", "tech"],
    ["Culture", "cult"],
    ["Sport", "sport"],
    ["Cinema", "cinema"],
    ["Music", "music"],
    ["Politics", "polit"],
    ["Economics", "econom"],
    ["Society", "soc"]
  ]

  scope :top, lambda {
    avg_rating = 0
    all_posts = self.find(:all)
    if all_posts.count != 0
      avg_rating = all_posts.sum(&:rating) / all_posts.count
    end
    { :conditions => ["rating >= ?", avg_rating] }
  }

  scope :by_user, lambda { |user_id|
    { :conditions => ["user_id = ?", user_id] }
  }

  scope :by_cat, lambda { |cat_name|
    { :conditions => ["category = ?", cat_name] }
  }

  scope :by_tag, lambda { |tag_name|    
    joins("join posts_tags, tags").
    where("posts.id = posts_tags.post_id
           AND posts_tags.tag_id = tags.id
           AND tags.name = ?", tag_name)
  }

  scope :rearrange, order("rating DESC, created_at DESC")

  def self.cat_name(cat_value)
    name = cat_value
    CATEGORIES.each { |disp, value|
      if value == cat_value
        name = disp
      end
    }
    name
  end

  def tag_list=(tags)
    self.tags.clear
    tags.split(',').each do |tag|
      Tag.find_or_create_by_name(tag.strip)
      self.tags << Tag.find_by_name(tag.strip)
    end
  end

  def tag_list
    tags.collect do |tag|
      tag.name
    end.join(',')
  end

  protected

  def validate
    correct_url = (source =~ %r{(ftp|http)://([_a-z\d\-]+(\.[_a-z\d\-]+)+)((/[_a-z\d\-\\\.]+)+)*}i)
    errors.add(:source, "should be correct url") if !source.nil? && !correct_url
  end

end
