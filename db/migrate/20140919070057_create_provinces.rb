class CreateProvinces < ActiveRecord::Migration
  def up
    create_table :provinces do |t|
      t.string :ine_name
      t.string :name
      t.string :slug

      t.timestamps

      t.index :slug
    end

    Province.create! ine_name: 'Araba/Álava', name: 'Álava'
    Province.create! ine_name: 'Albacete', name: 'Albacete'
    Province.create! ine_name: 'Alicante/Alacant', name: 'Alicante'
    Province.create! ine_name: 'Almería', name: 'Almería'
    Province.create! ine_name: 'Ávila', name: 'Ávila'
    Province.create! ine_name: 'Badajoz', name: 'Badajoz'
    Province.create! ine_name: 'Balears, Illes', name: 'Illes Balears'
    Province.create! ine_name: 'Barcelona', name: 'Barcelona'
    Province.create! ine_name: 'Burgos', name: 'Burgos'
    Province.create! ine_name: 'Cáceres', name: 'Cáceres'
    Province.create! ine_name: 'Cádiz', name: 'Cádiz'
    Province.create! ine_name: 'Castellón/Castelló', name: 'Castellón'
    Province.create! ine_name: 'Ciudad Real', name: 'Ciudad Real'
    Province.create! ine_name: 'Córdoba', name: 'Córdoba'
    Province.create! ine_name: 'Coruña, A', name: 'A Coruña'
    Province.create! ine_name: 'Cuenca', name: 'Cuenca'
    Province.create! ine_name: 'Girona', name: 'Girona'
    Province.create! ine_name: 'Granada', name: 'Granada'
    Province.create! ine_name: 'Guadalajara', name: 'Guadalajara'
    Province.create! ine_name: 'Gipuzkoa', name: 'Gipuzkoa'
    Province.create! ine_name: 'Huelva', name: 'Huelva'
    Province.create! ine_name: 'Huesca', name: 'Huesca'
    Province.create! ine_name: 'Jaén', name: 'Jaén'
    Province.create! ine_name: 'León', name: 'León'
    Province.create! ine_name: 'Lleida', name: 'Lleida'
    Province.create! ine_name: 'Rioja, La', name: 'La Rioja'
    Province.create! ine_name: 'Lugo', name: 'Lugo'
    Province.create! ine_name: 'Madrid', name: 'Madrid'
    Province.create! ine_name: 'Málaga', name: 'Málaga'
    Province.create! ine_name: 'Murcia', name: 'Murcia'
    Province.create! ine_name: 'Navarra', name: 'Navarra'
    Province.create! ine_name: 'Ourense', name: 'Ourense'
    Province.create! ine_name: 'Asturias', name: 'Asturias'
    Province.create! ine_name: 'Palencia', name: 'Palencia'
    Province.create! ine_name: 'Palmas, Las', name: 'Las Palmas'
    Province.create! ine_name: 'Pontevedra', name: 'Pontevedra'
    Province.create! ine_name: 'Salamanca', name: 'Salamanca'
    Province.create! ine_name: 'Santa Cruz de Tenerife', name: 'Santa Cruz de Tenerife'
    Province.create! ine_name: 'Cantabria', name: 'Cantabria'
    Province.create! ine_name: 'Segovia', name: 'Segovia'
    Province.create! ine_name: 'Sevilla', name: 'Sevilla'
    Province.create! ine_name: 'Soria', name: 'Soria'
    Province.create! ine_name: 'Tarragona', name: 'Tarragona'
    Province.create! ine_name: 'Teruel', name: 'Teruel'
    Province.create! ine_name: 'Toledo', name: 'Toledo'
    Province.create! ine_name: 'Valencia/Valéncia', name: 'Valencia'
    Province.create! ine_name: 'Valladolid', name: 'Valladolid'
    Province.create! ine_name: 'Bizkaia', name: 'Bizkaia'
    Province.create! ine_name: 'Zamora', name: 'Zamora'
    Province.create! ine_name: 'Zaragoza', name: 'Zaragoza'
    Province.create! ine_name: 'Ceuta', name: 'Ceuta'
    Province.create! ine_name: 'Melilla', name: 'Melilla'
  end

  def down
    drop_table :provinces
  end
end
