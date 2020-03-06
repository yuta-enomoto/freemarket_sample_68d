class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :slack]

  has_many :items, dependent: :destroy
  has_many :orders
  has_many :likes, dependent: :destroy
  has_many :like_items, through: :likes, source: :story
  has_many :sns_credentials
  has_many :seles
  has_one :credit_card
  has_one :address

  validates :nickname, :first_name, :last_name, :birthday, presence: true
  validates :email, presence: true,
            uniqueness: true,
            format: {
            with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
            message: "は正しく入力してください。"
          },
          on: :create
  validates :password, presence: true,
            length: { minimum: 7 },
            format: {
              with: /\A(?=.*?[a-z])(?=.*?\d)[a-zA-Z\d]+\z/,
              message: "は英字と数字の両方を含めて下さい。"
            },
            on: :create
  validates :first_furigana, :last_furigana, presence: true,
            format: {
              with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/,
              message: "は全角カタカナのみで入力して下さい。"
            }

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
