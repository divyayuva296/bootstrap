class StudentsController < ApplicationController
	helper_method :sort_column, :sort_direction
	before_action :authenticate_user!
	before_action :set_user, only: [:new,:create]
	def index
		@students = Student.all
		@students = Student.order(sort_column + " " + sort_direction)
		if params[:radio_input] == 'name'
			@students = Student.search(params[:search])
		elsif params[:radio_input] == 'subject'

			@students = Student.search(params[:search])
		else
			Student.all
		end
		# if params[:radio_input] == 'name'
		
		# 	@search = params[:search]

		# 	if @search.present?
		# 		@name = @search["name"]
		# 		@students = Student.where("name LIKE ? OR subject LIKE ?", "%#{@name}%","%#{@name}%")
		# 	end
		# elsif params[:radio_input] == 'subject'
		# 	@search = params[:search]
		# 	if @search.present?
		# 		@name = @search["name"]
		# 		@students = Student.where("name LIKE ? OR subject LIKE ?", "%#{@name}%","%#{@name}%")
		# 	end
		# else
		# 	Student.all
		# end		
	end

	def new
		@student = Student.new
	end

	def show
		@student = Student.find(params[:id])
	end

	def edit
		@student = Student.find(params[:id])
	end

	def create
		@student = @user.students.create(student_params)
		if @student.save
			redirect_to students_path
		else
			render 'new'
		end
	end

	def update
		@student = Student.find(params[:id])
		if @student.update(student_params)
			redirect_to students_path
		else
			render 'edit'
		end
	end

	def destroy
		@student = Student.find(params[:id])
		@student.destroy
		redirect_to students_path
	end

	private
	def student_params
		params.require(:student).permit(:name,:subject,:age,:user_id,:search,:in)
	end

	def set_user
		@user = current_user
	end

	def sort_column
		Student.column_names.include?(params[:sort]) ? params[:sort] : "name"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
