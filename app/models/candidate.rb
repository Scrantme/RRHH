class Candidate < ActiveRecord::Base
  # attr_accessible :title, :body
  has_attached_file :cv
  validates :cv, 
            attachment_content_type: { content_type: ['application/pdf', 'application/msword']}

  attr_accessible :nombre, :apellido, :edad, :mail, :celular, :otros_contactos, :perfil, :tecnologia, :seniority, :seniority, :descripcion, :estado, 
:fecha_ingreso_cv, :fecha_revisado_cv, :fecha_entrevistado, :cv, :cv_file_name, :cv_content_type

  filterrific :default_filter_params => { :sorted_by => 'created_at_desc' },
              :available_filters => [ :sorted_by, :search_query, :with_perfil ]
    
  
  self.per_page = 25

  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 3
    where(
      terms.map {
        or_clauses = [
          "LOWER(candidates.nombre) LIKE ?",
          "LOWER(candidates.apellido) LIKE ?",
          "LOWER(candidates.mail) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("candidates.created_at #{ direction }")
    when /^nombre_/
      order("LOWER(candidates.apellido) #{ direction }, LOWER(candidates.nombre) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
  
  

  scope :with_perfil, lambda { |perfiles|
    where(:perfil => [*perfiles])
  }


  def self.options_for_sorted_by
    [
      ['Nombre (a-z)', 'nombre_asc'],
      ['Nombre (z-a)', 'nombre_desc']
    ]
  end

  def self.options_for_select
    order('LOWER(perfil)').map {|p| p.perfil}.uniq
  end

  def nombre_completo
    [apellido, nombre].compact.join(', ')
  end

  def decorated_created_at
    created_at.to_date.to_s(:long)
  end
  
  def self.all_perfiles
    ['Administrador', 'Auditor', 'Analista BI','Analista de Calidad', 'Analista de Negocios', 'Analista de Organizacion y Metodos', 'Analista de Procesos', 'Analista de Seguridad Informatica', 'Analista Funcional', 'Analista Programador', 'Consultor', 'Coordinador', 'DBA', 'Gerente de Sistemas', 'Jefe de IT', 'Lider de Proyecto', 'Operador', 'Project Manager', 'QA', 'Soporte Tecnico', 'Tester', 'Vendedor IT', 'Arquitecto', 'Analista de Servicios', 'Analista Tecnico']
  end

  def self.all_seniorities
    ['Jr', 'Semi-senior', 'Senior']
  end

  def self.all_tecnologias
    ['Java', '.Net', 'COBOL', 'Oracle', 'Unix', 'SQL Server']
  end

  def self.all_salarios 
  end     
end
