class SearchsController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model,content,method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      else
        User.where('name Like ?',"%"+content+"%")
      end
    elsif model == "book"
      if method == 'perfect'
        Book.where(title: content,body: content)
      else method = 'partial'
        Book.where('title Like ? OR body Like?',"%"+content+"%")
      end
    end
  end

end
