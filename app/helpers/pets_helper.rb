module PetsHelper
  def adopt_province_path(params)
    adopt_species_path(params.slice :specie, :province)
  end

  def adopt_breed_path(params)
    adopt_species_path(params.slice :specie, :province, :breed)
  end

  def link_province_path(specie, province)
    title = SEO.link_title_for_province(specie, province)
    link_name = SEO.link_name_for_province(specie, province)
    path = adopt_province_path(specie: specie, province: province)
    link_to link_name, path, title: title
  end

  def breadcrumb_link(title, path)
    content_tag :div, class: 'breadcrumb-child', itemscope: true, itemtype: "http://data-vocabulary.org/Breadcrumb" do
      link_to path, { itemprop: "url" } do
        content_tag :span, title, itemprop: "title"
      end
    end
  end
end
