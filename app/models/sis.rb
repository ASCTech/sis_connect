class SIS < ActiveRecord::Base

  establish_connection configurations['sis']

  class Directory < SIS
    set_table_name 'PS_OS_DIRSERVICES'
    default_scope :select => 'os_namen, emplid'
  end

end
