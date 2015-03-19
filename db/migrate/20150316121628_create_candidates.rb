class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string 'nombre'
      t.string 'apellido'
      t.integer 'edad'
      t.string 'mail'
      t.string 'celular'
      t.text   'otros_contactos'
      t.string 'perfil'
      t.string 'tecnologia'
      t.string 'seniority'
      t.integer 'salario'
      t.text   'descripcion'
      t.string 'estado'
      t.date   'fecha_ingreso_cv'
      t.date   'fecha_revisado_cv'
      t.date   'fecha_entrevistado'
      t.timestamps
    end
  end
end
