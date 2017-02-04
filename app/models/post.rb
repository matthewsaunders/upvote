class Post < ApplicationRecord

  validates_format_of :link, with: /\Ahttps?:\/\/w{3}?.?[^\.$.?#]*.[\a-zA-Z]*\z/
end
