class CategoriesController < ApplicationController

	before_action :set_category, only: [:show, :edit, :update]
	before_action :require_user, except: [:index, :show]
	
	def index
		@categories = Category.all
	end

	def show
		@pcs = PostCategory.where(category_id: @category.id)
		@posts = Post.where(id: @pcs.pluck(:post_id))
	end

	def edit; end

	def update
		if @category.update(category_params)
			flash[:notice] = "Your category has been updated."
			redirect_to categories_path
		else
			render :edit
		end
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:notice] = "The new category has been saved"
			redirect_to categories_path
		else
			render :new
		end
	end

	private

	def category_params
		params.require(:category).permit!
	end

	def set_category
		@category = Category.find(params[:id])
	end
end
