class Profile < ActiveRecord::Base
  belongs_to :user

  validates_inclusion_of :gender, :in => ["male", "female"], :allow_nil => false

  validate :not_null_both, :not_male_sue

  def not_null_both
  	if last_name.nil? && first_name.nil? 
  		errors.add(:first_name, "cannot be both nil")
  		errors.add(:last_name, "cannot be both nil")
  	end
  end

  def not_male_sue
  	if (gender.eql? "male") && (first_name.eql? "Sue")
  		errors.add(:gender, "cannot be male and Sue") 
  	end
  end

  def self.get_all_profiles(min, max)
  		Profile.where("birth_year BETWEEN :min AND :max", min: min, max: max).order(birth_year: :asc)
  end
end
