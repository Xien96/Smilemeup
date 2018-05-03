class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :candidate_1,
    :path => ":rails_root/public/uploads/:id_candidate_1.jpeg",
    :url => "https://smile.alybadawy.com/uploads/:id_candidate_1.jpeg",
    :default_url => "/system/no_image.png"

  has_attached_file :candidate_2,
    :path => ":rails_root/public/uploads/:id_candidate_2.jpeg",
    :url => "https://smile.alybadawy.com/uploads/:id_candidate_2.jpeg",
    :default_url => "/system/no_image.png"

  has_attached_file :candidate_3,
    :path => ":rails_root/public/uploads/:id_candidate_3.jpeg",
    :url => "https://smile.alybadawy.com/uploads/:id_candidate_3.jpeg",
    :default_url => "/system/no_image.png"

  has_attached_file :candidate_4,
    :path => ":rails_root/public/uploads/:id_candidate_4.jpeg",
    :url => "https://smile.alybadawy.com/uploads/:id_candidate_4.jpeg",
    :default_url => "/system/no_image.png"

  has_attached_file :avatar,
    :path => ":rails_root/public/uploads/:id_avatar.jpeg",
    :url => "https://smile.alybadawy.com/uploads/:id_avatar.jpeg",
    :default_url => "/system/no_image.png"

  ## Validators
  validates_attachment  :candidate_1,
    content_type: { content_type: /\Aimage\/.*\Z/ },
    size: { less_than: 5.megabyte }

end
