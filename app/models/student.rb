class Student < ApplicationRecord
  belongs_to :user
  def self.search(search)
  	if search
    	# Student.where(['name LIKE ?', "%#{search}%"])
    	 Student.where(['name LIKE ? OR subject LIKE ?',"%#{search}%","%#{search}%"])
  	else
    	Student.all
    	# find(:all)
  	end
  end
end
