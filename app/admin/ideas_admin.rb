Trestle.resource(:ideas) do
  menu do
    item :ideas, icon: 'fa fa-question', priority: 2
  end

  collection do
    model.includes(:realms, :comments)
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :title
    column :content
    column :realms, format: :tags, class: 'hidden-xs' do |idea|
      idea.realms.map(&:title)
    end
    column :user
    # column :student_number
    column :comments_count
    column :created_at, align: :right
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |idea|
    tab :idea do
      text_field :title
      text_area :content, rows: 5
      select :realm_ids, Realm.all, { label: 'Realms' }, multiple: true

      row do
        col { datetime_field :updated_at }
        col { datetime_field :created_at }
      end
    end

    tab :comments do
      table CommentsAdmin.table, collection: idea.comments
    end

    tab :ratings do
      table RatingsAdmin.table, collection: idea.ratings
    end

    sidebar do
      static_field :updated_at
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:idea).permit(:name, ...)
  # end
end
