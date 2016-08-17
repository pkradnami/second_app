class Project < ActiveRecord::Base
    def self.search(search)
          if search
            find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
          else
            find(:all)
          end
    end
end
scope :name_like, -> name { where('name like ?', "%#{name}%") if name.present? }