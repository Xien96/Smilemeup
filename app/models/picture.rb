class Picture < ApplicationRecord
  has_attached_file :pic,
    :path => ":rails_root/public/uploads/:id_:style_:filename",
    :url => "https://smile.alybadawy.com/uploads/cars/:id_:style_:filename",
    :default_url => "/system/no_car.png",
    styles: {original: "1400x800>"}

  ## Validators
  validates_attachment  :pic,
    presence: true,
    content_type: { content_type: /\Aimage\/.*\Z/ },
    size: { less_than: 7.megabyte }

  def url
    self.pic.url
  end

end
