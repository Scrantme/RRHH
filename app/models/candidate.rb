class Candidate < ActiveRecord::Base
  # attr_accessible :title, :body
  has_attached_file :cv
  validates :cv, 
            attachment_content_type: { content_type: ['application/pdf', 'application/msword']}

  attr_accessible :nombre, :apellido, :edad, :mail, :celular, :otros_contactos, :perfil, :tecnologia, :seniority, :seniority, :descripcion, :estado, 
:fecha_ingreso_cv, :fecha_revisado_cv, :fecha_entrevistado, :cv, :cv_file_name, :cv_content_type
  
  def self.all_perfiles
    ['Administrador', 'Auditor', 'Analista BI','Analista de Calidad', 'Analista de Negocios', 'Analista de Organizacion y Metodos', 'Analista de Procesos', 'Analista de Seguridad Informatica', 'Analista Funcional', 'Analista Programador', 'Consultor', 'Coordinador', 'DBA', 'Gerente de Sistemas', 'Jefe de IT', 'Lider de Proyecto', 'Operador', 'Project Manager', 'QA', 'Soporte Tecnico', 'Tester', 'Vendedor IT', 'Arquitecto', 'Analista de Servicios', 'Analista Tecnico']
  end

  def self.all_seniorities
    ['Jr', 'Ssr', 'Sr']
  end

  def self.all_tecnologias
  end

  def self.all_salarios 
  end     
end
