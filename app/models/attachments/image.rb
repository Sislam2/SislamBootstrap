module Attachments
  class Image < Attachment
    has_attached_file :archive, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :archive, content_type: /\Aimage\/.*\z/
  end
end
