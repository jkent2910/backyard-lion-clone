class College < ActiveRecord::Base
  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.png"
  validates_attachment :logo,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                       size: { less_than: 2.megabytes }

  has_many :teams
  accepts_nested_attributes_for :teams, reject_if: :all_blank, allow_destroy: true

  has_many :users
  accepts_nested_attributes_for :users, reject_if: :all_blank, allow_destroy: true

  has_many :college_majors

  validates :name, :state, :city, presence: true

end