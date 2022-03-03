Trestle.admin(:dashboard) do
  menu do
    item :dashboard, icon: 'fa fa-tachometer', priority: 1
  end

  controller do
    def index; end
  end
end
