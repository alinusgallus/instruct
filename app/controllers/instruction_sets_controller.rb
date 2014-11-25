class InstructionSetsController < ApplicationController
	def new
		@instruction_set=InstructionSet.new
	end

	def create
		@instruction_set = InstructionSet.new(instruction_set_params)
		if @instruction_set.save
			flash[:success] = "New instruction set added"
			redirect_to @instruction_set
		else 
			render 'new'	
		end
	end

	def show
		@instruction_set = InstructionSet.find(params[:id])
	end

	def edit
		@instruction_set = InstructionSet.find(params[:id])
	end


	def update
		@instruction_set=InstructionSet.find(params[:id])
		if @instruction_set.update(instruction_set_params)
			flash[:success] = "Instruction set was sucessfully edited"
			redirect_to @instruction_set
		else
			render 'edit'
		end
	end


	def destroy
		@instruction_set = InstructionSet.find(params[:id])
		@instruction_set.destroy
		redirect_to instruction_sets_url
	end

	def index
		@instruction_sets = InstructionSet.all
	end

	private 
	def instruction_set_params
		params.require(:instruction_set).permit(:name, :description)
	end
end