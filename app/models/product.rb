class Product < ApplicationRecord
    validates :title, presence: true
    VALID_DELIVERY = ["pickup", "delivery", "pickup/delivery"]
    validates :delivery, inclusion: { in: VALID_DELIVERY }
    validates :image, presence: true
    VALID_PRICE_TYPE = ["asking price", "bidding", "see description", "trade", "free"]
    validates :price_type, inclusion: { in: VALID_PRICE_TYPE}
    #validates :postcode, presence: true, if: :pickup_requires_postcode?
    validates :price, presence: true, if: :price_type_requires_price?
    validates :body, presence: true

    extend Pagy::Searchkick
      belongs_to :user
      belongs_to :category
      has_many :bids, dependent: :destroy
      has_many_attached :image
      searchkick
      validate :image_type

      attr_accessor :distance

      private

      def image_type
        if image.attached? && !image.all? { |img| img.content_type.in?(%w[image/jpeg image/png]) }
          errors.add(:image, "Not supported image type! You can only upload .jpg or .png")
        end
      end

      def price_type_requires_price?
        price_type == "asking price"
      end
      #def pickup_requires_postcode?
      #delivery != "Bezorgen"
    #end
end
