class User < ApplicationRecord
  #  before_save: 
  # .downcase: 小文字に変換
  # 大文字と小文字の入力を矯正するため

  before_save { self.email = email.downcase }

  validates :name,  presence: true, length: { maximum: 50 }

  #正規表現にてメールアドレスを指定
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # presence: 空白を確認、length: 最大255文字
  # format: {正規表現}
  # uniqueness: 重複確認{case_sensitive:大文字小文字区別　false:区別しない }
  
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  #パスワードの長さ最小６文字指定       
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
