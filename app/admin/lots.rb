ActiveAdmin.register Lot do
  # Permitted parameters for strong parameters
  permit_params :title, :location, :size, :description, user_ids: []

  # Index Page Configuration
  index do
    selectable_column
    id_column
    column :title
    column :location
    column :size
    column :description
    column "Users" do |lot|
      lot.users.map(&:email).join(", ") # Display associated users' emails
    end
    column :created_at
    column :updated_at
    actions
  end

  controller do
    def create
      Rails.logger.info "PERMITTED PARAMS: #{permitted_params.inspect}"
      @lot = Lot.new(permitted_params[:lot])

      if params[:lot][:user_ids].present?
        @lot.users = User.where(id: params[:lot][:user_ids])
      end

      if @lot.save
        redirect_to admin_lot_path(@lot), notice: 'Lot was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # Show Page Configuration
  show do
    attributes_table do
      row :id
      row :title
      row :location
      row :size
      row :description
      row "Users" do |lot|
        lot.users.map(&:email).join(", ") # Display associated users' emails
      end
      row :created_at
      row :updated_at
    end

    # Users Table
    panel "Associated Users" do
      table_for lot.users do
        column :id
        column :name
        column :email
        column :created_at
        column :updated_at
      end
    end

    active_admin_comments
  end

  # Form for Creating/Editing a Lot
  form do |f|
    f.inputs 'Lot Details' do
      f.input :title
      f.input :location
      f.input :size
      f.input :description
      f.input :users, as: :check_boxes, collection: User.all.pluck(:email, :id) # Allow selecting users
    end
    f.actions
  end

  # Filters on the index page
  filter :title
  filter :location
  filter :size
  filter :users, collection: -> { User.all.pluck(:name, :id) }, label: "Associated Users"
  filter :created_at
  filter :updated_at
end
