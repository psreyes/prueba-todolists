class Profile < ActiveRecord::Base
  belongs_to :user

  validate :at_least_one
  validates :gender, format: {with: /male/, message: "only male or female"}
  validate :prevent
  
  def at_least_one
   if first_name == nil and last_name == nil
    errors.add(:first_name, "you have to fill at least one!")
   end
  end

  def prevent
    if gender == 'male' and first_name == 'Sue'
      errors.add(:first_name, "Don't name it as Sue")
    end
  end

attr_reader :minim, :maxim

def self.get_all_profiles(minimo, maximo)
  @minim = minimo
  @maxim = maximo
  anos = Profile.where("birth_year between :min and :max", min: @minim, max: @maxim)
  anos.all.order(birth_year: :asc)
end

end
